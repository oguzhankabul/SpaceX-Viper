//
//  ViewController.swift
//  SpaceX-Viper
//
//  Created by Oğuzhan Kabul on 12.07.2023.
//

import UIKit

class LaunchListViewController: UIViewController, LaunchListViewControllerProtocol {
    
    private var launchList: [LaunchPresentation] = []
    var presenter: LaunchListPresenterProtocol!
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(LaunchListCell.self, forCellReuseIdentifier: "LaunchListCell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .black
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
        setupConstraints()
        presenter.load()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func handleOutput(_ output: LaunchListPresenterOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .showLaunchList(let launchList):
            self.launchList = launchList
            tableView.reloadData()
        case .setLoading(let isLoading):
            if isLoading {
                activityIndicator.startAnimating()
                tableView.isHidden = true
            } else {
                activityIndicator.stopAnimating()
                tableView.isHidden = false
            }
        }
    }
}

extension LaunchListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LaunchListCell", for: indexPath) as! LaunchListCell
        cell.configureCell(launch: launchList[indexPath.row])
        return cell
    }
}

extension LaunchListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.selectLaunch(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

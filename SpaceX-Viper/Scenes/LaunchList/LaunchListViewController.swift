//
//  ViewController.swift
//  SpaceX-Viper
//
//  Created by Oğuzhan Kabul on 12.07.2023.
//

import UIKit

class LaunchListViewController: UIViewController, LaunchListViewControllerProtocol {
    
    private var launchList: [LaunchPresentation] = []
    private var pickerData: [Int] = []
    var presenter: LaunchListPresenterProtocol!
    
    private lazy var yearPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.delegate = self
        picker.dataSource = self
        picker.backgroundColor = .white
        picker.isHidden = true
        return picker
    }()
    
    private lazy var pickerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Select Year", for: .normal)
        button.addTarget(self, action: #selector(didTapPickerButton), for: .touchUpInside)
        return button
    }()
    
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
        [tableView, activityIndicator, yearPicker].forEach({ view.addSubview($0) })
        setupConstraints()
        presenter.load()
        
        let rightBarButtonItem = UIBarButtonItem(customView: pickerButton)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func didTapPickerButton() {
        yearPicker.isHidden = !yearPicker.isHidden
        if !yearPicker.isHidden {
            yearPicker.reloadAllComponents()
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            yearPicker.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            yearPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            yearPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            yearPicker.heightAnchor.constraint(equalToConstant: 180)
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
        case .updatePickerData(let years):
            pickerData = [0] + years
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
        let selectedLaunch = launchList[indexPath.row]
        presenter.selectLaunch(launchPresentation: selectedLaunch)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension LaunchListViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row] == 0 ? "All" : "\(pickerData[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedYear = pickerData[row]
            presenter.filterByLaunchYear(selectedYear)
    }
}

extension LaunchListViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
}

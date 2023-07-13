//
//  LaunchDetailViewController.swift
//  SpaceX-Viper
//
//  Created by Oğuzhan Kabul on 13.07.2023.
//

import UIKit

final class LaunchDetailViewController:UIViewController, LaunchDetailViewControllerProtocol {
    
    var presenter: LaunchDetailPresenterProtocol!
    var launchPresentation: LaunchPresentation!
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0.2
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var detailsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.bounds.height/5, height: view.bounds.height/5)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: "DetailCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        presenter.load()
    }
    
    func update(_ presentation: LaunchPresentation) {
        detailsLabel.text = presentation.details
        imageView.kf.setImage(with: presentation.links.missionPatch)
        self.launchPresentation = presentation
    }
    
    private func setupConstraints() {
        view.addSubview(imageView)
        view.addSubview(detailsLabel)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            detailsLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 24),
            detailsLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            detailsLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10),
            detailsLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10),
            
            collectionView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension LaunchDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return launchPresentation.detailPropertyList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCell", for: indexPath) as! DetailCollectionViewCell
        cell.label.text = launchPresentation.detailPropertyList[indexPath.row]
        return cell
    }
}

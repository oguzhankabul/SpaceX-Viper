//
//  LaunchListCell.swift
//  SpaceX-Viper
//
//  Created by Oğuzhan Kabul on 13.07.2023.
//

import UIKit

class LaunchListCell: UITableViewCell {
    
    private lazy var launchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var flightNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var missionNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var detailsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [flightNumberLabel, missionNameLabel, detailsLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 4
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        addSubview(launchImageView)
        addSubview(labelsStackView)
        
        // Define constraints
        NSLayoutConstraint.activate([
            launchImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            launchImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            launchImageView.heightAnchor.constraint(equalToConstant: 80),
            launchImageView.widthAnchor.constraint(equalToConstant: 80),
            
            labelsStackView.leadingAnchor.constraint(equalTo: launchImageView.trailingAnchor, constant: 16),
            labelsStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func configureCell(launch: LaunchPresentation) {
        flightNumberLabel.text = "Flight Number: \(launch.flightNumber)"
        missionNameLabel.text = launch.missionName
        detailsLabel.text = launch.details
        
        if let url = URL(string: launch.links.missionPatch) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.launchImageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }
}


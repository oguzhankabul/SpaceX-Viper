//
//  LaunchListCell.swift
//  SpaceX-Viper
//
//  Created by Oğuzhan Kabul on 13.07.2023.
//

import UIKit
import Kingfisher

class LaunchListCell: UITableViewCell {
    
    private lazy var launchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var flightNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var missionNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var detailsLabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
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
            launchImageView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 8),
            launchImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8),
            launchImageView.widthAnchor.constraint(equalToConstant: 88),
            launchImageView.heightAnchor.constraint(equalTo: launchImageView.widthAnchor),
            
            labelsStackView.leadingAnchor.constraint(equalTo: launchImageView.trailingAnchor, constant: 16),
            labelsStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.layoutIfNeeded()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        flightNumberLabel.text = nil
        missionNameLabel.text = nil
        detailsLabel.text = nil
        launchImageView.image = nil
    }
    
    func configureCell(launch: LaunchPresentation) {
        flightNumberLabel.text = "Flight Number: \(launch.flightNumber)"
        missionNameLabel.text = launch.missionName
        detailsLabel.text = launch.details
        launchImageView.kf.setImage(with: launch.links.missionPatchSmall, placeholder: UIImage.checkmark)
    }
}


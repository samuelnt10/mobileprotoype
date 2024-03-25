//
//  LaunchScreenViewController.swift
//  prototype
//
//  Created by Samuel Ntambwe on 2024-03-24.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create main text label ("ASLA")
        let mainTextLabel = UILabel()
        mainTextLabel.text = "ASLA"
        mainTextLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        mainTextLabel.textColor = UIColor.black
        mainTextLabel.textAlignment = .center
        mainTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add shadow effect to main text label
        mainTextLabel.layer.shadowColor = UIColor.black.cgColor
        mainTextLabel.layer.shadowOffset = CGSize(width: 0, height: 2)
        mainTextLabel.layer.shadowRadius = 4.0
        mainTextLabel.layer.shadowOpacity = 0.5
        
        // Create names label ("Samuel Ntambwe", "Marco Barrientos", "Ruslan Kalimov", "Adedolapo Balogun")
        let namesLabel = UILabel()
        namesLabel.text = "Samuel Ntambwe\nMarco Barrientos\nRuslan Kalimov\nAdedolapo Balogun"
        namesLabel.numberOfLines = 0
        namesLabel.font = UIFont.systemFont(ofSize: 20)
        namesLabel.textColor = UIColor.black
        namesLabel.textAlignment = .center
        namesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add subviews
        view.addSubview(mainTextLabel)
        view.addSubview(namesLabel)
        
        // Setup constraints
        NSLayoutConstraint.activate([
            mainTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainTextLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            
            namesLabel.topAnchor.constraint(equalTo: mainTextLabel.bottomAnchor, constant: 20),
            namesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            namesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
}

//
//  ConfigurationVC.swift
//  QuotesApp2
//
//  Created by Sarkhan Jafarli on 10/11/22.
//

import UIKit

class ConfigurationVC: UIViewController {
    
    var button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        button.addTarget(self, action: #selector(configureNotifications), for: .touchUpInside)
    }
    
    @objc func configureNotifications() {
        NotificationManager.shared.createNotifications()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    func configureUI(){
        view.backgroundColor = .systemBackground
        view.addSubview(button)
        
        button.setTitle("Set Notification", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        button.layer.cornerRadius = 20
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPink
        button.translatesAutoresizingMaskIntoConstraints = false
     
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

    
}

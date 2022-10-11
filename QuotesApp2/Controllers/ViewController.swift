//
//  ViewController.swift
//  QuotesApp2
//
//  Created by Sarkhan Jafarli on 10/11/22.
//

//Steps:


import UIKit
import UserNotifications

class ViewController: UIViewController {

    var lyrics: Lyrics?
    
    let textLabel = UILabel()
    let descriptionLabel = UILabel()
    let button = UIButton()
    let imageView = UIImageView()
    
    var userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
//        configureNotifications()
        button.addTarget(self, action: #selector(goToConfigurationVC), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true

    }
    
    @objc func goToConfigurationVC() {
        let destVC = ConfigurationVC()
        destVC.title = "Let's configure!"
        PersistenceManager.setWelcomeToTrue()
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        
        let views = [imageView, button, textLabel, descriptionLabel]
        for v in views {
            view.addSubview(v)
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        textLabel.text = "Welcome to Taylor Swift's Musical Universe!"
        textLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        textLabel.textColor = .label
        textLabel.numberOfLines = 0
        
        descriptionLabel.text = "Here we will provide you with the best and most wonderful quotes from your favorite artist, Taylor Swift. You will be able to choose the albums from which to receive lyrics and the time periods of notifications. There's a lot to discover. Click the button at the bottom of the screen and continue the journey!"
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        descriptionLabel.textColor = .secondaryLabel
        descriptionLabel.numberOfLines = 0
        
        button.setTitle("Let's Go!", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        button.layer.cornerRadius = 20
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGray


        imageView.image = UIImage(named: "taylor-speaknow")
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            descriptionLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 200),
            
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            button.heightAnchor.constraint(equalToConstant: 70),
            
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -112),
            imageView.widthAnchor.constraint(equalToConstant: 780),
            imageView.heightAnchor.constraint(equalToConstant: 468)
        ])

    }
    
//    func configureNotifications() {
//        NotificationsManager.shared.createNotifications()
//    }
    
//    func configureAPI() {
//        NetworkManager.shared.getRandomLyrics { result in
//            switch result {
//            case .success(let lyrics):
//                print(lyrics)
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
    
}







//
//    @IBAction func scheduleAction(_ sender: UIButton) {
//        notificationCenter.getNotificationSettings { settings in
//
//            DispatchQueue.main.async {
//                let title = self.titleTF.text!
//                let message = self.MessageTF.text!
//                let date = self.datePicker.date
//
//                if(settings.authorizationStatus == .authorized) {
//                    let content = UNMutableNotificationContent()
//                    content.title = title
//                    content.body = message
//
//                    let dateComp = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
//                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComp, repeats: false)
//                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//
//
//                    self.notificationCenter.add(request) { error in
//                        if(error != nil) {
//                            print("Error "+error.debugDescription)
//                            return
//                        }
//
//                        let ac = UIAlertController(title: "Notification Scheduled", message: "At "+self.formattedDate(date: date), preferredStyle: .alert)
//                        ac.addAction(UIAlertAction(title: "Ok", style: .default))
//                        self.present(ac, animated: true)
//                    }
//                }else{
//                    let ac = UIAlertController(title: "Enable Notifications", message: "To use this feature you need to enable notifications", preferredStyle: .alert)
//                    ac.addAction(UIAlertAction(title: "Cancel", style: .default))
//                    self.present(ac, animated: true)
//                }
//            }
////        }
//    }
//
//    func formattedDate(date: Date) -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "d MMM y HH:mm"
//        return formatter.string(from: date)
//    }
    

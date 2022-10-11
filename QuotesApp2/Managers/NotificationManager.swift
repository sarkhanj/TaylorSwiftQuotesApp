//
//  NotificationManager.swift
//  QuotesApp2
//
//  Created by Sarkhan Jafarli on 10/11/22.
//

import UIKit
import UserNotifications

class NotificationManager {
    static let shared = NotificationManager()
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    func createNotifications() {
//         Step 1. Ask for permission
        notificationCenter.requestAuthorization(options: [.alert, .sound]) { permissionGranted, _ in
            if(!permissionGranted) {
                print("Permission Denied")
            }
        }
        
        // Step 2. Create notification content
        let content = UNMutableNotificationContent()
        content.title = "Hey I'm a notification!"
        content.body = "Look here"
        
        // Step 3. When to show the user notification
        let date = Date().addingTimeInterval(2)
        let dateComp = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComp, repeats: false)
        
        // Step 4. Create request
        let id = UUID().uuidString
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        // Step 5. Register request with notification center
        notificationCenter.add(request) { error in
    //            print(error)
        }
    }
//    private func scheduleNotifications(){
//        for notification in notifications{
//            let content = UNMutableNotificationContent()
//            content.title = notification.title
//            content.sound = .default
//
//            let trigger = UNCalendarNotificationTrigger(dateMatching: notification.datetime, repeats: false)
//
//            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
//
//            UNUserNotificationCenter.current().add(request) { error in
//
//                guard error == nil else { return }
//
//                print("Notification scheduled! — ID = \(notification.id)")
//            }
//        }
//    }
    
    func listScheduledNotifications(){
        UNUserNotificationCenter.current().getPendingNotificationRequests { notifications in
            for notification in notifications {
            print(notification)
            }
        }
    }
    
    func schedule(){
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            
        switch settings.authorizationStatus {
            case .notDetermined:
                self.requestAuthorization()
            case .authorized, .provisional:
//                self.scheduleNotifications()
                break
            default:
                break // Do nothing
            }
        }
    }
    
    private func requestAuthorization(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in

            if granted == true && error == nil {
//                self.scheduleNotifications()
            }else {
                print("Permission Denied")
            }
        }
    }
    
}



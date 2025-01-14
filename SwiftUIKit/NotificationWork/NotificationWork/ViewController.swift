//
//  ViewController.swift
//  NotificationWork
//
//  Created by Nefise Hazır on 25.11.2024.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {
   var izinKontrol=false
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().delegate=self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {
            granted , error in
            self.izinKontrol=granted
            
            if granted {
                print("izin verildi")
            }else{
                print("izin verilmemiş !")
            }
        })
    }

    @IBAction func buttonBildirimOlustur(_ sender: Any) {
        if izinKontrol{
            let icerik = UNMutableNotificationContent()
            icerik.title="başlık"
            icerik.subtitle="alt başlık"
            icerik.body="Mesaj"
            icerik.badge=1
            icerik.sound=UNNotificationSound.default
            
            let tetikleme=UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let bildirimIstek=UNNotificationRequest(identifier: "id", content: icerik, trigger: tetikleme)
            
            UNUserNotificationCenter.current().add(bildirimIstek)
        }
    }
 
    
}

extension ViewController : UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner,.sound,.badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {

        center.setBadgeCount(0)
        
        let app = UIApplication.shared
        if app.applicationState == .active{
            print("ön plan")
        }
        if app.applicationState == .inactive{
            print("arka plan")
        }
        
        print("bildirim seçildi")
        completionHandler()
    }
}


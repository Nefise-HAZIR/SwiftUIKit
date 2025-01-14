//
//  ViewController.swift
//  UserInteractionSwift
//
//  Created by Nefise Hazır on 14.08.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonAlert(_ sender: Any) {
        let alertController=UIAlertController(title: "Alert", message: "message", preferredStyle: .alert)
        let cancelAction=UIAlertAction(title: "Cancel", style: .cancel){action in
            print("iptal seçildi")
        }
        let okAction=UIAlertAction(title: "Okey", style:.destructive){action in
            print("tamam seçildi")
        }
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated:true)
    }
    
    @IBAction func buttonActionSheet(_ sender: Any) {
        let alertController=UIAlertController(title: "Action Sheet", message: "message", preferredStyle: .actionSheet)
        let cancelAction=UIAlertAction(title: "Cancel", style: .cancel){action in
            print("iptal seçildi")
        }
        let okAction=UIAlertAction(title: "Okey", style:.destructive){action in
            print("tamam seçildi")
        }
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated:true)
    }
    @IBAction func buttonSpecialAlert(_ sender: Any) {
        let alertController=UIAlertController(title: "Special Alert", message: "message", preferredStyle: .alert)
        alertController.addTextField{ textField in
            textField.placeholder="Enter pass"
            textField.keyboardType = .numberPad
            textField.isSecureTextEntry=true
            
        }
        let okAction=UIAlertAction(title: "Save", style:.cancel){action in
            let tf=alertController.textFields![0] as UITextField
            if let data=tf.text{
                print("veri:\(data)")
            }
            print("tamam seçildi")
        }
        alertController.addAction(okAction)

        self.present(alertController, animated:true)
    }
}


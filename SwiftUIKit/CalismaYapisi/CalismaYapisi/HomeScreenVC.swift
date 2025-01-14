//
//  ViewController.swift
//  CalismaYapisi
//
//  Created by Nefise Hazır on 14.08.2024.
//

import UIKit

class HomeScreenVC: UIViewController {

    @IBOutlet weak var labelHome: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelHome.text="Hello"
    }

    @IBAction func buttonDoIt(_ sender: Any) {
        labelHome.text="Welcome Back"
    }
    
    @IBAction func buttonStart(_ sender: Any) {
        let kisi=Persons(ad: "nefise", yas: 23, boy: 1.78, bekar: true)
        performSegue(withIdentifier: "goToGame", sender: kisi)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("geçiş oldu")
        if segue.identifier=="goToGame"{
            print("game çalıştı ")
            if let veri=sender as? Persons{
                let gidilecekVC=segue.destination as! GameScreenVC
                gidilecekVC.person=veri
            }
        }
    }
    
    @IBAction func buttonAdd(_ sender: Any) {
        print("add seçildi")
    }
    @IBAction func buttonSave(_ sender: Any) {
        print("save seçili")
    }
}


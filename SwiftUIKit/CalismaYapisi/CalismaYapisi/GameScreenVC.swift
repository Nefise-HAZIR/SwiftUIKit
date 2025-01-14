//
//  GameScreenVC.swift
//  CalismaYapisi
//
//  Created by Nefise Hazır on 14.08.2024.
//

import UIKit

class GameScreenVC: UIViewController {
    var person:Persons?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k=person{
            print("-------Game------ ")
            print("game S:\(k.ad!)")
            print("game S:\(k.yas!)")
            print("game S:\(k.boy!)")
            print("game S:\(k.bekar!)")
        }
    }
    
    @IBAction func buttonBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        //navigationController?.popToRootViewController(animated: true) direkt anasayfaya
    }
    
    @IBAction func buttonFinish(_ sender: Any) {
        performSegue(withIdentifier: "goToResult", sender: nil)
    }
}

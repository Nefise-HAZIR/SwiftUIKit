//
//  ViewController.swift
//  MVVMSwift
//
//  Created by Nefise Hazır on 1.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldSayı2: UITextField!
    @IBOutlet weak var textFieldSayı1: UITextField!
    @IBOutlet weak var labelSonuc: UILabel!
    
    var viewModel=AnasayfaViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        _=viewModel.sonuc.subscribe(onNext: { //dinleme
            s in self.labelSonuc.text=s
        })
    }

    @IBAction func buttonToplama(_ sender: Any) {
        if let alinanSayi1=textFieldSayı1.text,let alinanSayi2=textFieldSayı2.text{
            viewModel.toplamaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
          
        }
    }
    
    @IBAction func buttonCarpma(_ sender: Any) {
        if let alinanSayi1=textFieldSayı1.text,let alinanSayi2=textFieldSayı2.text{
            viewModel.carpmaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
           
        }
    }
}


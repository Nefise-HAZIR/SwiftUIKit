//
//  RegisterPerson.swift
//  PersonsAppSwift
//
//  Created by Nefise Hazır on 27.08.2024.
//

import UIKit

class RegisterPerson: UIViewController {

    @IBOutlet weak var tfPersonName: UITextField!
    
    @IBOutlet weak var tfPersonPhone: UITextField!
    
    var viewModel=PersonRegisterViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func buttonSave(_ sender: Any) {
        if let ka=tfPersonName.text, let kt=tfPersonPhone.text{
            viewModel.save(person_name: ka, person_phone: kt)
        }
    }
    
   
    
}

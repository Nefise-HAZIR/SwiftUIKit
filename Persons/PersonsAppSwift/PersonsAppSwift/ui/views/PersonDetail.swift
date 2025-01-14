//
//  PersonDetail.swift
//  PersonsAppSwift
//
//  Created by Nefise Hazır on 27.08.2024.
//

import UIKit

class PersonDetail: UIViewController {

    @IBOutlet weak var tfPersonPhone: UITextField!
    @IBOutlet weak var tfPersonName: UITextField!
    
    var person:Persons?
    var viewModel=PersonDetailViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k=person{
            tfPersonName.text=k.person_name
            tfPersonPhone.text=k.person_phone
        }
    }
    

    @IBAction func buttonUpdate(_ sender: Any) {
        if let ka=tfPersonName.text, let kt=tfPersonPhone.text,let k=person{
            viewModel.update(person_id: k.person_id!, person_name: ka, person_phone: kt)
        }
    }
  
    

}

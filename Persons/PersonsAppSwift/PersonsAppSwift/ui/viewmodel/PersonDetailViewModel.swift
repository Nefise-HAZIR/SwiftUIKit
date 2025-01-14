//
//  PersonDetailViewModel.swift
//  PersonsAppSwift
//
//  Created by Nefise Hazır on 1.10.2024.
//

import Foundation
class PersonDetailViewModel{
    var kRepo=PersonsDaoRepository()
    func update(person_id:String,person_name:String,person_phone:String){
        kRepo.update(person_id: person_id, person_name: person_name, person_phone: person_phone)
    }
}

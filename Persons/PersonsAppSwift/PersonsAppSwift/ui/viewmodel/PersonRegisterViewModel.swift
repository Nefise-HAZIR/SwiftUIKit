//
//  PersonRegisterViewModel.swift
//  PersonsAppSwift
//
//  Created by Nefise Hazır on 1.10.2024.
//

import Foundation

class PersonRegisterViewModel{
    var kRepo=PersonsDaoRepository()
    func save(person_name:String,person_phone:String){
        kRepo.save(person_name: person_name, person_phone: person_phone)
    }
}

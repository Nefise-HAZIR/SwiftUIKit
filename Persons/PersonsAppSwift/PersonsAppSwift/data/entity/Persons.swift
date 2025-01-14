//
//  Persons.swift
//  PersonsAppSwift
//
//  Created by Nefise Hazır on 27.08.2024.
//

import Foundation

class Persons{
   
    var person_id:String?
    var person_name:String?
    var person_phone:String?
    
    init( ){
        
    }
    init(person_id: String , person_name: String, person_phone: String) {
        self.person_id = person_id
        self.person_name = person_name
        self.person_phone = person_phone
    }
    
}

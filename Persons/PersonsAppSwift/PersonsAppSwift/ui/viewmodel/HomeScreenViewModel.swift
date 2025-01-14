//
//  HomeScreenViewmodel.swift
//  PersonsAppSwift
//
//  Created by Nefise Hazır on 1.10.2024.
//

import Foundation
import RxSwift
class HomeScreenViewModel{
    var kRepo=PersonsDaoRepository()
    var personlsList=BehaviorSubject<[Persons]>(value: [Persons]())
    
    init(){
        personlsList=kRepo.personlsList
        kRepo.loadPersons()
    }
    func delete (person_id:String){
        kRepo.delete(person_id: person_id)
    }
    
    func search(searchText:String){
        kRepo.search(searchText: searchText)
    }
    
    func loadPersons( ){
        kRepo.loadPersons()
    }
    
}

//
//  KisilerDaoRepository.swift
//  PersonsAppSwift
//
//  Created by Nefise Hazır on 1.10.2024.
//

import Foundation
import RxSwift
import FirebaseFirestore

class PersonsDaoRepository {
    var personlsList=BehaviorSubject<[Persons]>(value: [Persons]())
    var collecrionKisiler = Firestore.firestore().collection("Kisiler")
    
    func save(person_name:String,person_phone:String){
        let newPerson:[String:Any]=["kisi_id":"","kisi_ad":person_name,"kisi_tel":person_phone]
        collecrionKisiler.document().setData(newPerson)
    }
    func update(person_id:String,person_name:String,person_phone:String){
        let updatePerson:[String:Any]=["kisi_ad":person_name,"kisi_tel":person_phone]
        collecrionKisiler.document(person_id).updateData(updatePerson)
    }
    func delete (person_id:String){
        collecrionKisiler.document(person_id).delete()
        
    }
    func search(searchText:String){
        collecrionKisiler.addSnapshotListener{snapshot,error in
            var list=[Persons]()
            if let documents = snapshot?.documents{
                for document in documents{
                    let data = document.data()
                    let person_id = document.documentID
                    let person_name = data["kisi_ad"] as? String ?? ""
                    let person_phone = data["kisi_tel"] as? String ?? ""
                    
                    if person_name.lowercased().contains(searchText.lowercased()){
                        let person=Persons(person_id: person_id, person_name: person_name, person_phone: person_phone)
                        list.append(person)
                    }
                    
                }
            }
            
            self.personlsList.onNext(list)
            
        }
    }
    
    func loadPersons(){
       
        collecrionKisiler.addSnapshotListener{snapshot,error in
            var list=[Persons]()
            if let documents = snapshot?.documents{
                for document in documents{
                    let data = document.data()
                    let person_id = document.documentID
                    let person_name = data["kisi_ad"] as? String ?? ""
                    let person_phone = data["kisi_tel"] as? String ?? ""
                    let person=Persons(person_id: person_id, person_name: person_name, person_phone: person_phone)
                    list.append(person)
                }
            }
            
            self.personlsList.onNext(list)
            
        }
       
    }
}

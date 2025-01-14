//
//  ViewController.swift
//  PersonsAppSwift
//
//  Created by Nefise Hazır on 27.08.2024.
//

import UIKit

class HomeScreen: UIViewController{
   
    @IBOutlet weak var personsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var personsList=[Persons]()
    var viewModel = HomeScreenViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate=self
        personsTableView.delegate=self
        personsTableView.dataSource=self
        
        _=viewModel.personlsList.subscribe(onNext: {list in
            self.personsList=list
            DispatchQueue.main.async {
                self.personsTableView.reloadData()

            }
        })
    }
  

    //@IBAction func buttonDetail(_ sender: Any) {
    //    let person=Persons(person_id: 1, person_name: "nefise", person_phone: "1111")
      //  performSegue(withIdentifier: "toDetail", sender: person)
    //}
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="toDetail"{
            if let person=sender as? Persons{
                let gidilecekVC=segue.destination as! PersonDetail
                gidilecekVC.person=person
            }
        }
    }
    
   
    
}

extension HomeScreen :UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""{
            viewModel.loadPersons()
        }else{
            viewModel.search(searchText: searchText)
        }
        
    }
}
extension HomeScreen : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personsList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person=personsList[indexPath.row]
        
        let hucre=tableView.dequeueReusableCell(withIdentifier: "kisilerHucre")as! KisilerHucre
        
        hucre.labelPersonName.text=person.person_name
        hucre.labePersonPhone.text=person.person_phone
        
        return hucre
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person=personsList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: person)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction=UIContextualAction(style: .destructive, title: "Delete"){contextualAction,view,bool in
            let person=self.personsList[indexPath.row]
            let alert=UIAlertController(title: "Silme İşlemi", message: "\(person.person_name!) silinsin mi ?", preferredStyle: .alert)
            let cancelAction=UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(cancelAction)
            let yesAction=UIAlertAction(title: "Evet", style: .destructive){
                action in
                self.viewModel.delete(person_id: person.person_id!)
            }
            alert.addAction(yesAction)
            self.present(alert, animated: true)
                    }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

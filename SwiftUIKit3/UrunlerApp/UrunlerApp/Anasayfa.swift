//
//  ViewController.swift
//  UrunlerApp
//
//  Created by Nefise Hazır on 17.09.2024.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var urunlerTableView: UITableView!
    var urunlerListesi=[Urunler]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urunlerTableView.delegate=self
        urunlerTableView.dataSource=self
        
        let u1=Urunler(id: 1, ad: "Macbook pro 14", resim: "bilgisayar", fiyat: 430000)
        let u2=Urunler(id: 1, ad: "Rayban Club Master", resim: "gozluk", fiyat: 25000)
        let u3=Urunler(id: 1, ad: "Sony zx series", resim: "kulaklik", fiyat: 40000)
        let u4=Urunler(id: 1, ad: "Gio Armani", resim: "parfum", fiyat: 2000)
        let u5=Urunler(id: 1, ad: "Casio", resim: "saat", fiyat: 9000)
        let u6=Urunler(id: 1, ad: "Dyson", resim: "supurge", fiyat: 18000)
        let u7=Urunler(id: 1, ad: "Iphone 13", resim: "telefon", fiyat: 32000)
        urunlerListesi.append(u1)
        urunlerListesi.append(u2)
        urunlerListesi.append(u3)
        urunlerListesi.append(u4)
        urunlerListesi.append(u5)
        urunlerListesi.append(u6)
        urunlerListesi.append(u7)
        
        urunlerTableView.separatorColor=UIColor(white: 0.95, alpha: 1)
    }
}

extension Anasayfa:UITableViewDelegate,UITableViewDataSource,HucreProtocol{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urunlerListesi.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let urun=urunlerListesi[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "urunlerHucre") as! UrunlerHucre
        
        hucre.imageViewUrun.image=UIImage(named: urun.resim!)
        hucre.labelUrunAd.text=urun.ad
        hucre.labelUrunFiyat.text="\(urun.fiyat!) TL"
        
        hucre.backgroundColor=UIColor(white: 0.95, alpha: 1)
        hucre.hucreArkaPlan.layer.cornerRadius=10.0
        hucre.selectionStyle = .none
        
        hucre.hucreProtocol = self
        hucre.indexPath = indexPath
        return hucre
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let urun=urunlerListesi[indexPath.row]
        let silAction=UIContextualAction(style: .destructive, title: "Sil"){
            contextualAction,view,bool in
            print("\(urun.ad!) silindi")
        }
        
        
        let düzenleAction=UIContextualAction(style: .normal, title: "Düzenle"){
            contextualAction,view,bool in
            print("\(urun.ad!) düzenlendi")
        }
        
        return UISwipeActionsConfiguration(actions:[silAction,düzenleAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urun=urunlerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: urun)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="toDetay"{
            if let urun = sender as? Urunler{
                let gidilecekVC=segue.destination as! Detaysayfa
                gidilecekVC.urun=urun
            }
        }
    }
    func sepeteEkleTiklandi(indexPath: IndexPath) {
        let urun=urunlerListesi[indexPath.row]
        print("\(urun.ad!) sepete eklendi")
    }
}


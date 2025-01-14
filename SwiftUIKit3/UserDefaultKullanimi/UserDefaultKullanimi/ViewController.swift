//
//  ViewController.swift
//  UserDefaultKullanimi
//
//  Created by Nefise Hazır on 25.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelSayac: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // tanimlama
        let ud=UserDefaults.standard
        
        //kayıt
        ud.set("Ahmet", forKey: "ad")
        ud.set(23, forKey: "yas")
        ud.set(1.78, forKey: "boy")
        ud.set(true, forKey: "bekar")
        
        let liste=["ali","ece"]
        ud.set(liste, forKey: "liste")
        
        let sehirler=["16":"Bursa","34":"istanbul"]
        ud.set(sehirler, forKey: "sehirler")
        
        //silme
         // ud.removeObject(forKey: "ad")
        
        //okuma
        let gelenAd=ud.string(forKey: "ad") ?? "isim yok"
        let gelenYas=ud.integer(forKey: "yas")
        let gelenBoy=ud.double(forKey: "boy")
        let gelenBekar=ud.bool(forKey: "bekar")
        print("gelen ad \(gelenAd)")
        let gelenliste=ud.array(forKey: "liste") ?? [String]()
        for a in gelenliste{
            print("gelen liste \(a)")
        }
        let gelenSehirler=ud.dictionary(forKey: "sehirler") ?? [String:String]()
        
        for (anahtar,deger) in gelenSehirler {
            print("gelen \(anahtar) : \(deger)")
        }
        
        //sayac uygulaması
        var sayac=ud.integer(forKey: "sayac")
        sayac = sayac + 1
        ud.set(sayac, forKey: "sayac")
        
        labelSayac.text="açılış sayacı : \(sayac)"
    }


}


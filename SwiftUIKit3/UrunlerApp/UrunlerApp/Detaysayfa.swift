//
//  Detaysayfa.swift
//  UrunlerApp
//
//  Created by Nefise Hazır on 17.09.2024.
//

import UIKit

class Detaysayfa: UIViewController {

    @IBOutlet weak var labelUrunFiyat: UILabel!
    @IBOutlet weak var imageViewUrun: UIImageView!
    
    var urun:Urunler?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let u=urun{
            self.navigationItem.title=u.ad
            imageViewUrun.image=UIImage(named:  u.resim!)
            labelUrunFiyat.text="\(u.fiyat!) TL"
            
            
        }
    }
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        if let u=urun{
            print( "Detay sayfa: \(u.ad!) sepete eklendi. ")
        }
    }
}

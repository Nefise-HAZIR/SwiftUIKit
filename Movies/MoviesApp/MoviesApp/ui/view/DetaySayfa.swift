//
//  DetaySayfa.swift
//  MoviesApp
//
//  Created by Nefise Hazır on 17.09.2024.
//

import UIKit
import Kingfisher
class DetaySayfa: UIViewController {

    @IBOutlet weak var labelFilm: UILabel!
    @IBOutlet weak var labelFiyat: UILabel!
    @IBOutlet weak var imageViewFilm: UIImageView!
    
    var film:Filmler?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let f=film{
            labelFilm.text=f.ad
            if let url=URL(string: "http://kasimadalan.pe.hu/filmler_yeni/resimler/\(f.resim!)"){
                DispatchQueue.main.async {
                    self.imageViewFilm.kf.setImage(with: url)
                }
            }
            labelFiyat.text="\(f.fiyat!) TL"
        }

        // Do any additional setup after loading the view.
    }
    

  

}

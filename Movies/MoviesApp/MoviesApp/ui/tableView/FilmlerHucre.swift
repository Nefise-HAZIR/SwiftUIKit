//
//  FilmlerHucre.swift
//  MoviesApp
//
//  Created by Nefise Hazır on 17.09.2024.
//

import UIKit
protocol HucreProtocol{
    func sepeteEkleTikla(indexPath:IndexPath)
}
class FilmlerHucre: UICollectionViewCell {
    
    @IBOutlet weak var labelFiyat: UILabel!
    @IBOutlet weak var imageViewFilm: UIImageView!
    
    var hucreProtocol:HucreProtocol?
    var indexpath:IndexPath?
    
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        hucreProtocol?.sepeteEkleTikla(indexPath: indexpath!)
    }
}

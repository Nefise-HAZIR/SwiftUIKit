//
//  ViewController.swift
//  MoviesApp
//
//  Created by Nefise Hazır on 17.09.2024.
//

import UIKit
import Kingfisher
class AnaSayfa: UIViewController {

    @IBOutlet weak var filmlerCollectionView: UICollectionView!
    var filmlerListesi=[Filmler]()
    var viewModel=AnasayfaViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        filmlerCollectionView.delegate=self
        filmlerCollectionView.dataSource=self
        _=viewModel.filmlerListesi.subscribe(onNext: { liste in
            self.filmlerListesi=liste
            DispatchQueue.main.async {
                self.filmlerCollectionView.reloadData()
            }
        })
        
        let tasarim=UICollectionViewFlowLayout()
        tasarim.sectionInset=UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumLineSpacing=10
        tasarim.minimumInteritemSpacing=10
        
        let ekranGenislik=UIScreen.main.bounds.width
        let itemGenislik=(ekranGenislik-30)/2
        
        tasarim.itemSize=CGSize(width: itemGenislik, height: itemGenislik*1.6)
        filmlerCollectionView.collectionViewLayout=tasarim
    }


}
extension AnaSayfa : UICollectionViewDelegate,UICollectionViewDataSource,HucreProtocol{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListesi.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let film=filmlerListesi[indexPath.row]
        
        let hucre=collectionView.dequeueReusableCell(withReuseIdentifier: "filmlerHucre", for: indexPath) as! FilmlerHucre
        
        
        if let url=URL(string: "http://kasimadalan.pe.hu/filmler_yeni/resimler/\(film.resim!)"){
            DispatchQueue.main.async {
                hucre.imageViewFilm.kf.setImage(with: url)
            }
        }
        
        hucre.labelFiyat.text="\(film.fiyat!) TL"
        hucre.layer.borderColor=UIColor.lightGray.cgColor
        hucre.layer.borderWidth=0.3
        hucre.layer.cornerRadius=10.0
        
        hucre.hucreProtocol=self
        hucre.indexpath=indexPath
        
        return hucre
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let film=filmlerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: film)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="toDetay"{
            if let film=sender as? Filmler{
                let gidilecekVC=segue.destination as! DetaySayfa
                gidilecekVC.film=film
            }
        }
    }
    func sepeteEkleTikla(indexPath: IndexPath) {
        let film=filmlerListesi[indexPath.row]
        print("\(film.ad!) sepete eklendi")
    }
}


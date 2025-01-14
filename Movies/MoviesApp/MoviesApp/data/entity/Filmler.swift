//
//  Filmler.swift
//  MoviesApp
//
//  Created by Nefise Hazır on 17.09.2024.
//

import Foundation

class Filmler{
    var id:String?
    var ad:String?
    var resim:String?
    var fiyat:Int?
    
    init() {
        
    }
    
    init(id: String, ad: String, resim: String, fiyat: Int) {
        self.id = id
        self.ad = ad
        self.resim = resim
        self.fiyat = fiyat
    }}

//
//  HomeScreenViewModel.swift
//  MoviesApp
//
//  Created by Nefise Hazır on 25.10.2024.
//

import Foundation
import RxSwift
class AnasayfaViewModel {
    var fRepo=FilmlerDaoRepository()
    var filmlerListesi=BehaviorSubject<[Filmler]>(value: [Filmler]())
    init() {
        filmlerListesi=fRepo.filmlerListesi
        fimleriYukle()
    }
    func fimleriYukle( ){
        fRepo.fimleriYukle()
    }
    
}

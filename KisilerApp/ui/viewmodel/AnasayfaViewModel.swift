//
//  AnasayfaViewModel.swift
//  KisilerApp
//
//  Created by Zeynep Sevgi on 30.10.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    var kisilerListesi = BehaviorSubject<[KisilerModel]>(value: [KisilerModel]())
    var krepo = KisilerDaoRepository()
    
    init() {
        kisilerListesi = krepo.kisilerListesi
        kisileriYukle()
    }
    
    func sil(kisi: KisilerModel) {
        krepo.sil(kisi: kisi)
    }
    func ara(aramaKelimesi:String) {
        krepo.ara(aramaKelimesi: aramaKelimesi)
    }
    func kisileriYukle() {
        krepo.kisileriYukle()
        
    }
}

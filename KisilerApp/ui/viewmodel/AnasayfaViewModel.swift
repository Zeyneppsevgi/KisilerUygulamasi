//
//  AnasayfaViewModel.swift
//  KisilerApp
//
//  Created by Zeynep Sevgi on 30.10.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    var krepo = KisilerDaoRepository()
    
    init() {
        kisilerListesi = krepo.kisilerListesi
        kisileriYukle()
    }
    
    func sil(kisi_id: String) {
        krepo.sil(kisi_id: kisi_id)
    }
    func ara(aramaKelimesi:String) {
        krepo.ara(aramaKelimesi: aramaKelimesi)
    }
    func kisileriYukle() {
        krepo.kisileriYukle()
        
    }
}

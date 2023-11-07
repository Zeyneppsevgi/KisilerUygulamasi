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
    
    func sil(kisi_id: Int) {
        krepo.sil(kisi_id: kisi_id)
    }
    func ara(aramaKelimesi:String) {
        krepo.ara(aramaKelimesi: aramaKelimesi)
    }
    func kisileriYukle() {
        krepo.kisileriYukle()
        
    }
    //hazır kodlama 
    func veritabaniKopyala() {
        let bundleYolu = Bundle.main.path(forResource: "rehber kopyası", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber kopyasi.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("Veritabanı zaten var")
        } else {
            do {
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            } catch{}
        }
    }
}

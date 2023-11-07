//
//  KisilerDaoRepository.swift
//  KisilerApp
//
//  Created by Zeynep Sevgi on 30.10.2023.
//

import Foundation
import RxSwift

class KisilerDaoRepository {
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    func kaydet(kisi_ad:String, kisi_tel:String){
        print("Kişi kaydet: \(kisi_ad) - \(kisi_tel)")
    }
    func guncelle(kisi_id:Int, kisi_ad:String, kisi_tel:String){
        print("Kişi güncelle: \(kisi_id) - \(kisi_ad) - \(kisi_tel)")
    }
    func sil(kisi_id: Int) {
        print("Kişi Sil: \(kisi_id)")
        kisileriYukle()
    }
    func ara(aramaKelimesi:String) {
        print("Arandı: \(aramaKelimesi)")
    }
    func kisileriYukle() {
        var liste = [Kisiler]()
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "Zeynep", kisi_tel: "11111")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "Ahmet", kisi_tel: "22222")
        let k3 = Kisiler(kisi_id: 3, kisi_ad: "Ali", kisi_tel: "33333")
        liste.append(k1)
        liste.append(k2)
        liste.append(k3)
        kisilerListesi.onNext(liste) //tetikleme
    }
}

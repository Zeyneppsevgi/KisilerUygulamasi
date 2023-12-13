//
//  KisilerDaoRepository.swift
//  KisilerApp
//
//  Created by Zeynep Sevgi on 30.10.2023.
//

import Foundation
import RxSwift
import CoreData

class KisilerDaoRepository {
    var kisilerListesi = BehaviorSubject<[KisilerModel]>(value: [KisilerModel]())
    
    let context = appDelegate.persistentContainer.viewContext
    
    func kaydet(kisi_ad:String, kisi_tel:String){
        let kisi = KisilerModel(context: context)
        kisi.kisi_ad = kisi_ad
        kisi.kisi_tel = kisi_tel
        
        appDelegate.saveContext()
    }
    func guncelle(kisi:KisilerModel, kisi_ad:String, kisi_tel:String){
        kisi.kisi_ad = kisi_ad
        kisi.kisi_tel = kisi_tel
        
        appDelegate.saveContext()
        
            }
    func sil(kisi:KisilerModel) {
        context.delete(kisi)
        appDelegate.saveContext()
        kisileriYukle()
    }
    func ara(aramaKelimesi:String) {
        do {
            let fr = KisilerModel.fetchRequest()
            fr.predicate = NSPredicate(format: "kisi_ad CONTAINS[c] %@", aramaKelimesi) //büyük küçük harf farketmemesi içi n c
            let liste = try context.fetch(fr)
            kisilerListesi.onNext(liste) //tetikleme
        }catch {
            print(error.localizedDescription)
        }
    }
    func kisileriYukle() {
        do {
            let liste = try context.fetch(KisilerModel.fetchRequest())
            kisilerListesi.onNext(liste) //tetikleme
        }catch {
            print(error.localizedDescription)
        }
       
    }
}

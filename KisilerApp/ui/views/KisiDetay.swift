//
//  KisiDetay.swift
//  KisilerApp
//
//  Created by Zeynep Sevgi on 25.10.2023.
//

import UIKit

class KisiDetay: UIViewController {

    @IBOutlet weak var tfKisi_tel: UITextField!
    @IBOutlet weak var tfKisi_ad: UITextField!
    //veri aktarımı
    var kisi:KisilerModel?
    
    var viewModel = KisiDetayViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let k = kisi {
            tfKisi_ad.text = k.kisi_ad
            tfKisi_tel.text = k.kisi_tel
        }
        
    }
    
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let ka = tfKisi_ad.text, let kt = tfKisi_tel.text, let k = kisi { //k aslında id 14.satırdaki id değişmez
            viewModel.guncelle(kisi: k, kisi_ad: ka , kisi_tel: kt)
        }

    }
    
    
   
}

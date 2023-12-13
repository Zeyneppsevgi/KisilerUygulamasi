//
//  KisiKayit.swift
//  KisilerApp
//
//  Created by Zeynep Sevgi on 25.10.2023.
//

import UIKit

class KisiKayit: UIViewController {

    @IBOutlet weak var tfKisi_tel: UITextField!
    @IBOutlet weak var tfKisi_ad: UITextField!
    
    var viewModel = KisiKayitViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonKaydet(_ sender: Any) {
        if let ka = tfKisi_ad.text, let kt = tfKisi_tel.text {
            viewModel.kaydet(kisi_ad: ka, kisi_tel: kt)
              
        }
    }
    
}

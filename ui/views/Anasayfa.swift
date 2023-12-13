//
//  ViewController.swift
//  KisilerApp
//
//  Created by Zeynep Sevgi on 25.10.2023.
//

import UIKit

class Anasayfa: UIViewController{

    @IBOutlet weak var kisilerTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var kisilerListesi = [Kisiler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "Zeynep", kisi_tel: "11111")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "Ahmet", kisi_tel: "22222")
        let k3 = Kisiler(kisi_id: 3, kisi_ad: "Ali", kisi_tel: "33333")
        kisilerListesi.append(k1)
        kisilerListesi.append(k2)
        kisilerListesi.append(k3)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let kisi = sender as? Kisiler {
                let gidilecekVC = segue.destination as! KisiDetay
                gidilecekVC.kisi = kisi
            }
        }
    }
    

}
extension Anasayfa: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Kişi ara: \(searchText)")
    }
}
extension Anasayfa: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = kisilerListesi[indexPath.row]
        //celle eriştik tableviewe
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre") as! KisilerHucre
        hucre.labelKisiAd.text = kisi.kisi_ad
        hucre.labelKisiTel.text = kisi.kisi_tel
        //tek tek labelları alıp yazdırıcak tableviewe
        return hucre
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = kisilerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: kisi)
        tableView.deselectRow(at: indexPath, animated: true) //seçili olma özelliğini kaldırıyor
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil") {contextualAction, view, bool in
            let kisi = self.kisilerListesi[indexPath.row]
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
    
}


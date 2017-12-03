//
//  InputViewController.swift
//  MakananIndonesia
//
//  Created by Rio Ihsan on 12/3/17.
//  Copyright © 2017 Rio Ihsan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class InputViewController: UIViewController {
    @IBOutlet weak var etNama: UITextField!
    @IBOutlet weak var etAsal: UITextField!
    @IBOutlet weak var etHarga: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func Simpan(_ sender: Any) {
        let nNama = etNama.text!
        let nAsal = etAsal.text!
        let nHarga = etHarga.text!
        
        if ((nNama.isEmpty) || (nAsal.isEmpty) || (nHarga.isEmpty)) {
            let alertWarning = UIAlertController(title: "Warning", message: "This is required", preferredStyle: .alert)
            let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertWarning.addAction(aksi)
            present(alertWarning, animated: true, completion: nil)
        }else{
            let params = ["nama_makanan": nNama, "asal_makanan": nAsal, "harga_makanan": nHarga]
            print(params)
            
            let url = "http://localhost/MakananServer/index.php/Api/daftar"
            
            Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { (responseServer) in
                
                print(responseServer.result.isSuccess)
                
                if responseServer.result.isSuccess{
                    let json = JSON(responseServer.result.value as Any)
                    let alertWarning = UIAlertController(title: "Congrats", message: "Data berhasil disimpan", preferredStyle: .alert)
                    let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertWarning.addAction(aksi)
                    self.present(alertWarning, animated: true, completion: nil)
                    
                }
                
            })
        }
    }
}





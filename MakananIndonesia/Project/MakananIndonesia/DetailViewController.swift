//
//  DetailViewController.swift
//  MakananIndonesia
//
//  Created by Rio Ihsan on 12/3/17.
//  Copyright © 2017 Rio Ihsan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var nama: UILabel!
    @IBOutlet weak var asal: UILabel!
    @IBOutlet weak var harga: UILabel!
    
    var passID:String?
    var passNama:String?
    var passAsal:String?
    var passHarga:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        id.text = passID!
        nama.text = passNama!
        asal.text = passAsal!
        harga.text = passHarga!

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

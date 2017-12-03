//
//  MakananTableViewController.swift
//  MakananIndonesia
//
//  Created by Rio Ihsan on 12/3/17.
//  Copyright © 2017 Rio Ihsan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MakananTableViewController: UITableViewController {
    var idSelected:String?
    var namaSelected:String?
    var asalSelected:String?
    var hargaSelected:String?
    
    var makanan = [Makanan]()
    var arr = [[String: AnyObject]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://localhost/MakananServer/index.php/Api/getMakanan").responseJSON{ (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["data"].arrayObject {
                    self.arr = resData as! [[String:AnyObject]]
                }
                if self.arr.count > 0 {
                    self.tableView.reloadData()
                }
            }
        }
    }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "makanan", for: indexPath) as! MakananTableViewCell

        // Configure the cell...
        var dict = arr[indexPath.row]
        cell.nama.text = dict["nama_makanan"] as? String
        cell.harga.text = dict["harga_makanan"] as? String

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("Row \(indexPath.row)selected")
        
        let task = arr[indexPath.row]
        idSelected = task["id_makanan"] as? String
        namaSelected = task["nama_makanan"] as? String
        asalSelected = task["asal_makanan"] as? String
        hargaSelected = task["harga_makanan"] as? String
        
        performSegue(withIdentifier: "passMakanan", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passMakanan"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! DetailViewController
                let value = arr[indexPath.row]
                controller.passID = value["id_makanan"] as? String
                controller.passNama = value["nama_makanan"] as? String
                controller.passAsal = value["asal_makanan"] as? String
                controller.passHarga = value["harga_makanan"] as? String
            }
        }
    }
}




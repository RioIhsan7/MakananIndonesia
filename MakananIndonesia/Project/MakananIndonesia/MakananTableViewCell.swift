//
//  MakananTableViewCell.swift
//  MakananIndonesia
//
//  Created by Rio Ihsan on 12/3/17.
//  Copyright © 2017 Rio Ihsan. All rights reserved.
//

import UIKit

class MakananTableViewCell: UITableViewCell {
    @IBOutlet weak var nama: UILabel!
    @IBOutlet weak var harga: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

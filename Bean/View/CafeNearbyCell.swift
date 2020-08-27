//
//  CafeNearbyCell.swift
//  Bean
//
//  Created by William Ho on 2020-08-26.
//  Copyright © 2020 William Ho. All rights reserved.
//

import UIKit

class CafeNearbyCell: UITableViewCell {


    @IBOutlet var cafeNameLabel: UILabel!
    @IBOutlet var cafeAddressLabel: UILabel!
    @IBOutlet var cafeRatingLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

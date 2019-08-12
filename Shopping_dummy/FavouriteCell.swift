//
//  FavouriteCell.swift
//  Shopping_dummy
//
//  Created by JIJO G OOMMEN on 07/08/19.
//  Copyright © 2019 JIJO G OOMMEN. All rights reserved.
//

import UIKit

class FavouriteCell: UITableViewCell {

    @IBOutlet var fav_image: UIImageView!
    
    @IBOutlet var fav_price: UILabel!
    
    @IBOutlet var fav_name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

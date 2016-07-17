//
//  ShopTableViewCell.swift
//  unisportAPP
//
//  Created by Umoru Joseph on 7/13/16.
//  Copyright © 2016 Umoru Joseph. All rights reserved.
//

import UIKit

class ShopTableViewCell: UITableViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productSizes: UILabel!
    @IBOutlet weak var productCurrency: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPriceOld: UILabel!
    @IBOutlet weak var productDeliveryDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

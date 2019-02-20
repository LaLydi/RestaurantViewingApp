//
//  RestaurantTableViewCell.swift
//  RestaurantViewingApp
//
//  Created by Lydia Marion on 2/10/19.
//  Copyright © 2019 Lydia. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantTableViewCell: UITableViewCell {
    
    @IBOutlet weak var restaurantImageView : UIImageView!
    @IBOutlet weak var markerImageView : UIImageView!
    @IBOutlet weak var restaurantNameLabel : UILabel!
    @IBOutlet weak var locationLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with viewModel : RestaurantListViewModel) {
        restaurantImageView.af_setImage(withURL: viewModel.imageURL)
        restaurantNameLabel.text = viewModel.name
        locationLabel.text = viewModel.formattedDistance
    }

}

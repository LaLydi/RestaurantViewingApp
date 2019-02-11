//
//  BaseView.swift
//  RestaurantViewingApp
//
//  Created by Lydia Marion on 2/10/19.
//  Copyright © 2019 Lydia. All rights reserved.
//

import UIKit

// Subclass a UIView
@IBDesignable class BaseView : UIView {
    
    // Override the 2 inits
    override init(frame : CGRect) {
        // Init the view with the frame
        super.init(frame : frame)
        self.configure()
    }
    required init?(coder aDecoder: NSCoder) {
        // The init is called by the storyboard
        super.init(coder : aDecoder)
        self.configure()
    }
    
    func configure() {
        
    }
}

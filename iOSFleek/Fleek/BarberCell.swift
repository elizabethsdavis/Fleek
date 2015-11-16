//
//  BarberCell.swift
//  Fleek
//
//  Created by Cody Sugarman on 11/14/15.
//  Copyright © 2015 Cody Sugarman. All rights reserved.
//

import Foundation
import UIKit

class BarberCell: UITableViewCell {

    @IBOutlet weak var barberPhoto: UIImageView!
    @IBOutlet weak var barberNumStars: UILabel!
    @IBOutlet weak var barberName: UILabel!
    @IBOutlet weak var barberDistance: UILabel!
    @IBOutlet weak var barberLikes: UILabel!
    @IBOutlet weak var barberPrice: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
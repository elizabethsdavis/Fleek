//
//  ViewBarber.swift
//  Fleek
//
//  Created by Cody Sugarman on 11/15/15.
//  Copyright © 2015 Cody Sugarman. All rights reserved.
//

import Foundation
import UIKit

class ViewBarber: UIViewController {
    
    //barberInfo follows following structure:
    //[NAME, DISTANCE, LIKES, PRICE, IMAGE, NUM_STARS]
    var barberInfo:[AnyObject]!
    
    @IBOutlet weak var barberName: UILabel!
    @IBOutlet weak var barberImage: UIImageView!
    
    override func viewDidLoad() {
        barberName.text = (barberInfo[0] as! String)
        barberImage.image = UIImage(named: barberInfo[4] as! String)
    }
    
}
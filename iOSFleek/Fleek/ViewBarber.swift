//
//  ViewBarber.swift
//  Fleek
//
//  Created by Cody Sugarman on 11/15/15.
//  Copyright © 2015 Cody Sugarman. All rights reserved.
//

import Foundation
import UIKit

let reuseIdentifier = "BarberPhotoCell"
class ViewBarber: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate   {
    
    //barberInfo follows following structure:
    //[NAME, DISTANCE, LIKES, PRICE, IMAGE, NUM_STARS]
    var barberInfo:[AnyObject]!
    
    @IBOutlet weak var barberName: UILabel!
 
    @IBOutlet weak var barberDistance: UILabel!
    @IBOutlet weak var barberImage: UIImageView!
    @IBOutlet weak var barberLikes: UILabel!
    @IBOutlet weak var barberPrice: UILabel!
    @IBOutlet weak var barberPhotos: UICollectionView!
    
    override func viewDidLoad() {
        barberName.text = (barberInfo[0] as! String)
        barberDistance.text = (barberInfo[1] as! String)
        barberLikes.text = String(barberInfo[2] as! NSNumber) + " Likes"
        let price = barberInfo[3] as! NSNumber
        var symbol = ""
        for var i = 0; i < Int(price); ++i {
            symbol += "$"
        }
        barberPrice.text = symbol
        barberImage.image = UIImage(named: barberInfo[4] as! String)
        
        barberPhotos.dataSource = self
        barberPhotos.delegate = self
        barberPhotos.registerClass(BarberPhotoCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        barberPhotos.backgroundColor = UIColor.whiteColor()
        
    }
    
    func numberOfSectionsInCollectionView(barberPhotos: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(barberPhotos: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    
    func collectionView(barberPhotos: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        let cell = barberPhotos.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! BarberPhotoCell
        cell.backgroundColor = UIColor.blackColor()
        cell.barberPhotoImage?.image = UIImage(named: "Max")
        return cell
    }
    
}
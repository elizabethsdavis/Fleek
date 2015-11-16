//
//  ViewBarbers.swift
//  Fleek
//
//  Created by Cody Sugarman on 11/14/15.
//  Copyright © 2015 Cody Sugarman. All rights reserved.
//

import Foundation
import UIKit

class ViewBarbers: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let textCellIdentifier = "barberCell"
    let barberShopNames = ["Shop 1", "Shop 2", "Shop 3", "Shop 4", "Shop 5"]
    let barberShopDistances = ["0.1 mi away", "2.4 mi away", "1.7 mi away", "3.6 mi away", "7.4 mi away"]
    let barberShopLikes = [89, 34, 10, 50, 73, 14]
    //The number of dollar signs displayed
    let barberShopPrices = [2, 4, 1, 3, 2]
    let barberShopImages = ["BarberShop1.jpg", "BarberShop2.jpg", "BarberShop3.jpg", "BarberShop4.jpg", "BarberShop5.jpg"]
    let barberShopNumStars = [4, 2, 5, 1, 3]
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return barberShopNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! BarberCell
        let row = indexPath.row
        cell.barberName.text = barberShopNames[row]
        cell.barberDistance.text = barberShopDistances[row]
        cell.barberLikes.text = String(barberShopLikes[row]) + " Likes"
        cell.barberNumStars.text = String(barberShopNumStars[row]) + " Stars"
        cell.barberName.text = barberShopNames[row]
        let numDollarSigns = barberShopPrices[row]
        cell.barberPrice.text = ""
        for _ in 1...numDollarSigns {
            cell.barberPrice.text = cell.barberPrice.text! + "$"
        }
        cell.barberPhoto.image = UIImage(named: barberShopImages[row])
        return cell
    }
    
    override func viewDidLoad() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    // When row tapped:
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let row = indexPath.row
        //Create array of type AnyObject to pass all relevant data to new ViewController
        let barberInfo:[AnyObject] = [barberShopNames[row], barberShopDistances[row], barberShopLikes[row], barberShopPrices[row], barberShopImages[row], barberShopNumStars[row]]
        self.performSegueWithIdentifier("showBarberDetail", sender: barberInfo)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showBarberDetail") {
            let detailController = segue.destinationViewController as! ViewBarber
            let barberInfo = sender as! [AnyObject]
            detailController.barberInfo = barberInfo
        }
    }
    
    @IBAction func cancelNewBarber(sender: UIStoryboardSegue) {
    }
    
    @IBAction func saveNewBarber(sender: UIStoryboardSegue) {
    }
    
}
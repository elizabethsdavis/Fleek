//
//  CreateBarber.swift
//  Fleek
//
//  Created by Cody Sugarman on 11/14/15.
//  Copyright © 2015 Cody Sugarman. All rights reserved.
//

import Foundation
import UIKit

class CreateBarber: UIViewController, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var barberImage: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        setUpBarberImage()
    }
    
    func setUpBarberImage() {
        let tapGesture = UITapGestureRecognizer(target: self, action: "changeBarberImage")
        barberImage.addGestureRecognizer(tapGesture)
        barberImage.userInteractionEnabled = true
        let userPlaceholderImage = UIImage(named:"NewPhoto.jpg")
        barberImage.image = userPlaceholderImage
    }
    
    func changeBarberImage() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    //Not updating picture
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            barberImage.image = pickedImage
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func displayCreationSuccess() {
        let creationSuccess = UIAlertView(title: "Barber Profile Created", message: "You have successfully created a new barber profile!", delegate: self, cancelButtonTitle: "OK")
        creationSuccess.show()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "saveNewBarber") {
            displayCreationSuccess()
        }
    }
    
}



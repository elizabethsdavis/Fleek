//
//  SendMessage.swift
//  Fleek
//
//  Created by Elizabeth Davis on 11/20/15.
//  Copyright © 2015 Cody Sugarman. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

let textMessageRecipients = ["1-555-555-5555"]

class SendMessageViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
    }

    @IBAction func sendMessage(sender: AnyObject) {
        if (MFMessageComposeViewController.canSendText()) {
            let messageVC = MFMessageComposeViewController()
            messageVC.body = "Hello! I am a potential client, and would love to make an appointment!";
            messageVC.recipients = textMessageRecipients
            messageVC.messageComposeDelegate = self;
            self.presentViewController(messageVC, animated: false, completion: nil)
        } else {
            print("Can't send text messages...")
        }
        
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        switch (result.rawValue) {
        case MessageComposeResultCancelled.rawValue:
            print("Message was cancelled")
            self.dismissViewControllerAnimated(true, completion: nil)
        case MessageComposeResultFailed.rawValue:
            print("Message failed")
            self.dismissViewControllerAnimated(true, completion: nil)
        case MessageComposeResultSent.rawValue:
            print("Message was sent")
            self.dismissViewControllerAnimated(true, completion: nil)
        default:
            break;
        }
    }
}
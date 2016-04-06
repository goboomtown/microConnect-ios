//
//  ViewController.swift
//  ConnectHelp-Swift
//
//  Created by Matthew Lewin on 3/18/16.
//  Copyright © 2016 Boomtown. All rights reserved.
//

import UIKit
import BTConnectHelp

let apiToken            = "__API_TOKEN__"
let apiSecret 			= "__API_SECRET_KEY__"

let memberID           	= "__MEMBERS_ID__"
let memberUserID     	= "__MEMBERS_USERS_ID__"
let memberLocationID 	= "__MEMBERS_LOCATIONS_ID__"

class ViewController: UIViewController, BTConnectHelpButtonDelegate {

    @IBOutlet weak var subview: UIView!
    @IBOutlet weak var storyboardHelpButton: BTConnectHelpButton! {
        didSet {
			storyboardHelpButton.setCredentialsWithToken(apiToken, secret: apiSecret)
			
            storyboardHelpButton.delegate = self
            
            storyboardHelpButton.memberID          	= memberID
			storyboardHelpButton.memberUserID      	= memberUserID
            storyboardHelpButton.memberLocationID  	= memberLocationID
			
			storyboardHelpButton.supportWebsiteURL 	 = NSURL(string: "http://example.com");
            storyboardHelpButton.supportEmailAddress = "support@example.com"
            storyboardHelpButton.supportPhoneNumber  = "1-888-555-2368"
        }
    }
    
    lazy var programmaticHelpButton: BTConnectHelpButton = {
        [unowned self] in
        let button = BTConnectHelpButton(frame: self.view.frame)
        button.delegate = self
        
        button.memberID          = memberID
        button.memberUserID      = memberUserID
		button.memberLocationID  = memberLocationID

		button.supportWebsiteURL   =  NSURL(string: "http://example.com");
        button.supportEmailAddress = "support@example.com"
        button.supportPhoneNumber  = "1-888-555-2368"
        
		button.setCredentialsWithToken(apiToken, secret: apiSecret)
		
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Boomtown Sample App"
		self.view.addSubview(programmaticHelpButton)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    func helpButton(helpButton: BTConnectHelpButton, displayIssueViewController viewController: UIViewController) {
        showViewController(viewController, sender: helpButton)
    }

    func helpButton(helpButton: BTConnectHelpButton, displayHelpActionSheet alertController: UIAlertController) {
        presentViewController(alertController, animated: true, completion: nil)
        if let popoverController = alertController.popoverPresentationController {
            popoverController.sourceView = helpButton
            popoverController.sourceRect = helpButton.bounds
        }
	}
	
    func helpButton(helpButton: BTConnectHelpButton, didFailWithError error: NSError) {
		NSLog("%@", error.localizedDescription + ":" + error.localizedFailureReason!)
    }
	
    func helpButtonDidSetCredentials(helpButton: BTConnectHelpButton) {
        NSLog("Everything is ready to proceed.")
    }
    
}

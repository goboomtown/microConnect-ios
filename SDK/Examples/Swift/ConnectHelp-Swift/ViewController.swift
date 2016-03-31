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
			
            storyboardHelpButton.supportWebsiteURL 	 = "http://example.com"
            storyboardHelpButton.supportEmailAddress = "support@example.com"
            storyboardHelpButton.supportPhoneNumber  = "1-888-555-2368"
        }
    }
    
    lazy var programmaticHelpButton: BTConnectHelpButton = {
        [unowned self] in
        let button = BTConnectHelpButton(frame: self.subview.frame)
        button.delegate = self
        
        button.memberID          = memberID
        button.memberUserID      = memberUserID
		button.memberLocationID  = memberLocationID

		button.supportWebsiteURL   = "http://example.com"
        button.supportEmailAddress = "support@example.com"
        button.supportPhoneNumber  = "1-888-555-2368"
        
		button.setCredentialsWithToken(apiToken, secret: apiSecret)
		
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Boomtown Sample App"
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        view.addSubview(programmaticHelpButton)
    }

	func helpButton(helpButton: AnyObject, displayIssueViewController viewController: UIViewController) {
		navigationController?.pushViewController(viewController, animated: true)
	}

	func helpButton(helpButton: AnyObject, displayHelpActionSheet alertController: UIAlertController) {
		navigationController?.presentViewController(alertController, animated: true, completion:nil)
	}
	
	func helpButton(helpButton: AnyObject, authorizationFailedWithStatus status: NSNumber, message: String) {
		NSLog("%@", message)
	}
	
	func helpButton(helpButton: AnyObject, alertWithMessage message: String?) {
		NSLog("Missing information")
	}
	
}

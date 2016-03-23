//
//  ViewController.swift
//  ConnectHelp-Swift
//
//  Created by Matthew Lewin on 3/18/16.
//  Copyright © 2016 Boomtown. All rights reserved.
//

import UIKit
import BTConnectHelp

let API_TOKEN            = "__API_TOKEN__"
let API_SECRET: NSString = "__API_SECRET_KEY__" //< Declare API_SECRET as NSString to workaround Swift Foundation bug

let MEMBERS_ID           = "__MEMBERS_ID__"
let MEMBERS_LOCATIONS_ID = "__MEMBERS_LOCATIONS_ID__"
let MEMBERS_USERS_ID     = "__MEMBERS_USERS_ID__"

class ViewController: UIViewController {

    @IBOutlet weak var subview: UIView!
    @IBOutlet weak var storyboardHelpButton: BTConnectHelpButton! {
        didSet {
            // NOTE: Because of a Foundation bug, API_SECRET must be declared as NSString and cast to String
            storyboardHelpButton.setCredentialsWithToken(API_TOKEN, secret: API_SECRET as String)
            
            storyboardHelpButton.delegate = self
            
            storyboardHelpButton.membersId           = MEMBERS_ID;
            storyboardHelpButton.membersLocationsId  = MEMBERS_LOCATIONS_ID;
            storyboardHelpButton.membersUsersId      = MEMBERS_USERS_ID;
            
            storyboardHelpButton.supportWebsiteUrl 	 = "http://example.com"
            storyboardHelpButton.supportEmailAddress = "support@example.com"
            storyboardHelpButton.supportPhoneNumber  = "1-888-555-2368"
        }
    }
    
    lazy var programmaticHelpButton: BTConnectHelpButton = {
        [unowned self] in
        let button = BTConnectHelpButton(frame: self.subview.frame)
        button.delegate = self;
        
        button.membersId           = MEMBERS_ID;
        button.membersLocationsId  = MEMBERS_LOCATIONS_ID;
        button.membersUsersId      = MEMBERS_USERS_ID;

        button.supportWebsiteUrl   = "http://example.com"
        button.supportEmailAddress = "support@example.com"
        button.supportPhoneNumber  = "1-888-555-2368"
        
        // NOTE: Because of a Foundation bug, API_SECRET must be declared as NSString and cast to String
        button.setCredentialsWithToken(API_TOKEN, secret: API_SECRET as String)
        
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

    func displayConnectHelpViewController(vc: BTConnectHelpViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
}

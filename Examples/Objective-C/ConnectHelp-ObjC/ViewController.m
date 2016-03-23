//
//  ViewController.m
//  ConnectHelp-ObjC
//
//  Created by Matthew Lewin on 3/14/16.
//  Copyright © 2016 Boomtown. All rights reserved.
//

#import "ViewController.h"

const NSString *API_TOKEN      = @"__API_TOKEN__";
const NSString *API_SECRET     = @"__API_SECRET_KEY__";

NSString *MEMBERS_ID           = @"__MEMBERS_ID__";
NSString *MEMBERS_LOCATIONS_ID = @"__MEMBERS_LOCATIONS_ID__";
NSString *MEMBERS_USERS_ID     = @"__MEMBERS_USERS_ID__";

@interface ViewController ()

@property (weak, nonatomic) IBOutlet BTConnectHelpButton    *storyboardHelpButton;
@property (weak, nonatomic) IBOutlet UIView                 *subview;

@property (strong, nonatomic)	BTConnectHelpButton *programmaticHelpButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Boomtown Sample App";
    
    [self.storyboardHelpButton setCredentialsWithToken:API_TOKEN secret:API_SECRET];

    self.storyboardHelpButton.delegate = self;

    self.storyboardHelpButton.membersId           = MEMBERS_ID;
    self.storyboardHelpButton.membersLocationsId  = MEMBERS_LOCATIONS_ID;
    self.storyboardHelpButton.membersUsersId      = MEMBERS_USERS_ID;
    
    self.storyboardHelpButton.supportWebsiteUrl   = @"http://example.com";
    self.storyboardHelpButton.supportEmailAddress = @"support@example.com";
    self.storyboardHelpButton.supportPhoneNumber  = @"1-888-555-2368";
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.programmaticHelpButton = [[BTConnectHelpButton alloc] initWithFrame:self.subview.frame];
    self.programmaticHelpButton.delegate = self;
    
    self.programmaticHelpButton.membersId           = MEMBERS_ID;
    self.programmaticHelpButton.membersLocationsId  = MEMBERS_LOCATIONS_ID;
    self.programmaticHelpButton.membersUsersId      = MEMBERS_USERS_ID;
    
    self.programmaticHelpButton.supportWebsiteUrl 	= @"http://example.com";
    self.programmaticHelpButton.supportEmailAddress = @"support@example.com";
    self.programmaticHelpButton.supportPhoneNumber 	= @"1-888-555-2368";
    [self.programmaticHelpButton setCredentialsWithToken:API_TOKEN secret:API_SECRET];
    [self.view addSubview:self.programmaticHelpButton];
}

- (void) displayConnectHelpViewController:(BTConnectHelpViewController *)vc
{
    [self.navigationController pushViewController:vc animated:YES];
}

@end

//
//  ViewController.m
//  ConnectHelp-ObjC
//
//  Created by Matthew Lewin on 3/14/16.
//  Copyright © 2016 Boomtown. All rights reserved.
//

#import "ViewController.h"

NSString *apiToken   	= @"__API_TOKEN__";
NSString *apiSecret   	= @"__API_SECRET_KEY__";

NSString *memberID          = @"__MEMBERS_ID__";
NSString *memberUserID     	= @"__MEMBERS_USERS_ID__";
NSString *memberLocationID 	= @"__MEMBERS_LOCATIONS_ID__";

@interface ViewController () <BTConnectHelpButtonDelegate>

@property (weak, nonatomic) IBOutlet BTConnectHelpButton    *storyboardHelpButton;
@property (weak, nonatomic) IBOutlet UIView                 *subview;

@property (strong, nonatomic)	BTConnectHelpButton *programmaticHelpButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Boomtown Sample App";
    
    [self.storyboardHelpButton setCredentialsWithToken:apiToken secret:apiSecret];

    self.storyboardHelpButton.delegate = self;

    self.storyboardHelpButton.memberID         	= memberID;
	self.storyboardHelpButton.memberUserID      = memberUserID;
    self.storyboardHelpButton.memberLocationID  = memberLocationID;
	
    self.storyboardHelpButton.supportWebsiteURL   = [NSURL URLWithString:@"http://example.com"];
    self.storyboardHelpButton.supportEmailAddress = @"support@example.com";
    self.storyboardHelpButton.supportPhoneNumber  = @"1-888-555-2368";
	
	self.programmaticHelpButton = [[BTConnectHelpButton alloc] initWithFrame:self.view.frame];
	self.programmaticHelpButton.delegate = self;
	
	self.programmaticHelpButton.memberID           	= memberID;
	self.programmaticHelpButton.memberUserID      	= memberUserID;
	self.programmaticHelpButton.memberLocationID 	= memberLocationID;
	
	self.programmaticHelpButton.supportWebsiteURL 	= [NSURL URLWithString:@"http://example.com"];
	self.programmaticHelpButton.supportEmailAddress = @"support@example.com";
	self.programmaticHelpButton.supportPhoneNumber 	= @"1-888-555-2368";
	[self.programmaticHelpButton setCredentialsWithToken:apiToken secret:apiSecret];
	[self.view addSubview:self.programmaticHelpButton];
    
    [self.programmaticHelpButton advertiseServiceWithPublicData:@{@"test":@"data"}
                                                    privateData:@{@"test":@"private data"}];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}


#pragma mark - Help button delegates

- (void) helpButton:(BTConnectHelpButton *)helpButton didAdvertiseService:(NSNetService *)netService
{
    NSLog(@"mDNS service successfully advertised.");
}


- (void) helpButton:(BTConnectHelpButton *)helpButton didFailToAdvertiseService:(NSDictionary<NSString *,NSNumber *> *)errorDict
{
    NSLog(@"mDNS service failed to advertise.");
}




- (void) helpButton:(nonnull BTConnectHelpButton *)helpButton  displayHelpActionSheet:(nonnull UIAlertController *)alertController
{
    if ( self.view.traitCollection.horizontalSizeClass != UIUserInterfaceSizeClassCompact )
    {
        [self presentViewController:alertController animated:YES completion:nil];
		UIPopoverPresentationController *popPresenter = [alertController
														 popoverPresentationController];
		popPresenter.sourceView = helpButton;
		popPresenter.sourceRect = helpButton.bounds;
	}
	else
	{
		[self.navigationController presentViewController:alertController animated:YES completion:nil];
	}
}


- (void) helpButton:(nonnull BTConnectHelpButton *)helpButton displayIssueViewController:(UIViewController *)viewController
{
	[self.navigationController pushViewController:viewController animated:YES];
}


- (void) helpButton:(nonnull BTConnectHelpButton *)helpButton didFailWithError:(nonnull NSError *)error
{
	NSLog(@"%@: %@", error.localizedDescription, error.localizedFailureReason);
}


- (void) helpButtonDidSetCredentials:(nonnull BTConnectHelpButton *)helpButton
{
    NSLog(@"Everything is ready to proceed.");
}




@end

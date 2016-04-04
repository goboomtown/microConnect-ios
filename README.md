# Boomtown microConnect for iOS (v.1.2)

#### Minmum Requirements
- Xcode 7.2
- iOS 8.0

## Overview
**microConnect-ios** contains `BTConnectHelp`, an iOS framework for [Connect][connectLink] partners. It allows partners to integrate issue creation, notification, and chat in a single `BTConnectHelpButton` button.

## Getting Started

1. Clone this repository
2. Drag `BTConnectHelp.framework` from the SDK folder into the `Embedded Binaries` section in `Targets->General`
3. In the "Choose options for adding these files" dialog, ensure "Copy items if needed" is checked and "Create Groups" is selected next to "Added folders"

## API Key Generation
1. Log onto the Admin Portal (https://admin.goboomtown.com)
1. Click "Providers" in the left menu
1. Find your provider in the list
1. Double-click your provider to show the "Edit Provider" window
1. Click "API Settings,"" near the button of the configuration panel
1. Select Sandbox or Live, depending on the state of development
1. Click "Re-Generate"
1. Copy the access token and private-key, as provided in the pop-up dialog

## Obtaining Member Information
For chat to work, **microConnect-ios** requires you specify the member and user information of the person using your app. This information can be obtained as follows:

1. Log onto the Admin Portal (https://admin.goboomtown.com)
1. Click "Providers" in the left menu
1. Find and double-click your provider to show the "Edit Provider" window
1. Click "Members" along the top of the "Edit Provider" window
1. Find and double-click the appropriate member from the list to show the "Edit Member" window
1. The `Id` field of the Member Info section contains the value to use for `BTConnectHelpButton.membersId`
1. Click "Locations" along the top of the "Edit Member" window
1. Find and double-click the appropriate location for the user of your app to show the "Edit Member Location" window
1. The `Id` field of the Location Information section contains the value to use for `BTConnectHelpButton.membersLocationId`
1. Click "Discard & Close" in the lower right to return to the "Edit Member" window
1. Click "Users" along the top of the "Edit Member" window
1. Find and double-click the user of your app to show the "Edit Member User" window
1. The `Id` field of the Member User Info section contains the value to use for `BTConnectHelpButton.membersUsersId`


## Usage

_Note:_ Objective-C and Swift examples may be found in the `Examples` folder of this repository

### Objective-C
```Objective-C

@import BTConnectHelp;

//	Create BTConnectHelp button and add it to view
BTConnectHelpButton *connectHelpButton = [[BTConnectHelpButton alloc] initWithFrame:self.subview.frame];
connectHelpButton.delegate = self;

connectHelpButton.membersId             = MEMBERS_ID;
connectHelpButton.membersLocationsId    = MEMBERS_LOCATIONS_ID;
connectHelpButton.membersUsersId        = MEMBERS_USERS_ID;

connectHelpButton.supportWebsiteUrl 	= @"http://example.com";
connectHelpButton.supportEmailAddress   = @"support@example.com";
connectHelpButton.supportPhoneNumber 	= @"1-888-555-2368";

[connectHelpButton setCredentialsWithToken:API_TOKEN secret:API_SECRET];
[self.view addSubview:connectHelpButton];


//	Implement callback to display the BTConnect Help view controller
- (void) displayConnectHelpViewController:(BTConnectHelpViewController *)vc
{
	[self.navigationController pushViewController:vc animated:YES];
}

```

### Swift
```Swift

import BTConnectHelp

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
self.view.addSubview(button)

func displayConnectHelpViewController(vc: BTConnectHelpViewController) {
    navigationController?.pushViewController(vc, animated: true)
}

```

## Appearance

A `BTConnectHelpButton` can be added to your app programmatically or within a storyboard, as shown in this screenshot from one of the included example apps.

![screenshot example initial view][imgLinkInitialView]

Tapping the `BTConnectHelpButton` will take your user to the Help view.

![screenshot help view][imgLinkHelpView]

From the Help view, the user may tap the buttons for chat, web, e-mail, or phone support. If the user taps "Chat With Us," an issue will be created for him, and he will be taken to a chat room associated with that issue.

![screenshot chat view][imgLinkChatView]

## Acknowledgements

**microConnect-ios** makes use of various open source libraries, and we are grateful for the contributions of the open source community.

To help you acknowledge the open source libraries we have used, we have included two files in the root of the repository:

- `Acknowledgements.md` is a Markdown file for you to use however makes sense for you.
- `Acknowledgements.plist` is an Apple PLIST file designed for use in a Settings bundle.

[connectLink]:http://www.goboomtown.com/connect/
[imgLinkChatView]:https://raw.githubusercontent.com/goboomtown/microConnect-ios/master/Examples/Images/Connect%20Chat%20View.png
[imgLinkHelpView]:https://raw.githubusercontent.com/goboomtown/microConnect-ios/master/Examples/Images/Connect%20Help%20View.png
[imgLinkInitialView]:https://raw.githubusercontent.com/goboomtown/microConnect-ios/master/Examples/Images/Sample%20Initial%20View.png

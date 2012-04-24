//
//  PelajarAppDelegate.h
//  Pelajar
//
//  Created by aufa on 4/10/12.
//  Copyright 2012 TMRND. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PelajarViewController, StudentViewController;

@interface PelajarAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PelajarViewController *viewController;

@property (nonatomic, retain) IBOutlet StudentViewController *studentViewController;

@end

//
//  StudentViewController.h
//  Pelajar
//
//  Created by aufa on 4/10/12.
//  Copyright 2012 TMRND. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StudentViewController : UITableViewController {
    NSMutableArray *studentData;
    NSString *path;
    
}
- (void)addStudent:(UIBarButtonItem *)button;

@end

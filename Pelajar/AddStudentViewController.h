//
//  AddStudentViewController.h
//  Pelajar
//
//  Created by aufa on 4/10/12.
//  Copyright 2012 TMRND. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddStudentViewController : UIViewController {
    
   UITextField *nameTextField;
}

@property (nonatomic, retain) IBOutlet UITextField *nameTextField;

-(IBAction) cancelButtonPressed: (UIButton *) button;

- (IBAction)saveButtonPressed:(id)sender;


@end

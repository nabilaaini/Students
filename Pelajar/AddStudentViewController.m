//
//  AddStudentViewController.m
//  Pelajar
//
//  Created by aufa on 4/10/12.
//  Copyright 2012 TMRND. All rights reserved.
//

#import "AddStudentViewController.h"


@implementation AddStudentViewController
@synthesize nameTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [nameTextField release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setNameTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction) cancelButtonPressed: (UIButton *) button;
{
    [self dismissModalViewControllerAnimated:YES];
}


- (IBAction)saveButtonPressed:(id)sender {
    
    NSString *name = nameTextField.text;
    NSLog(@"%@", name);
    
    //save/write Students.plist   //10
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];                                       //ley write anything in doc directory only
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"Students.plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSError *error;
    
    //if file doesn't exist copy students.plist in mainBundle to document path.  (nk delete ni l;ey sbab dh ade kt view did load)  //11
    if (![fileManager fileExistsAtPath:path]) {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"Students" ofType:@"plist"];
        
        [fileManager copyItemAtPath:bundle toPath:path error:&error];
    }
    
    NSMutableDictionary *savedName = [[NSMutableDictionary alloc] initWithContentsOfFile:path];  //12
    [[savedName objectForKey:@"Students"] addObject:name];
    [savedName writeToFile:path atomically:YES];
    [savedName release];
    
    [self dismissModalViewControllerAnimated:YES];
}

@end

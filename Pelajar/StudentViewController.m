//
//  StudentViewController.m
//  Pelajar
//
//  Created by aufa on 4/10/12.
//  Copyright 2012 TMRND. All rights reserved.
//

#import "StudentViewController.h"
#import "AddStudentViewController.h"


@implementation StudentViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [ path release];
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
    
    //NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Students" ofType:@"plist"];
    
   // NSLog (@"filePath = %@", filePath);
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);  //2
    NSString *documentDirectory = [paths objectAtIndex:0];                                    //3   //ley write anything in doc directory only
    path = [[NSString alloc] initWithString:[documentDirectory stringByAppendingPathComponent:@"Students.plist"]];  //4
           
    
    NSFileManager *fileManager = [NSFileManager defaultManager];  //5
    
    NSError *error;
    
    //if file doesn't exist copy students.plist in mainBundle to document path.
    if (![fileManager fileExistsAtPath:path]) {  //6
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"Students" ofType:@"plist"];  //1
        
        if (![fileManager createDirectoryAtPath:documentDirectory withIntermediateDirectories:NO attributes:nil error:&error]) //7 if not
        {
            
        }
        
       [fileManager copyItemAtPath:bundle toPath:path error:&error];

    }

    //fetch data
    NSDictionary *data = [[NSDictionary alloc] initWithContentsOfFile:path]; //read fr file  //8
    studentData = [[NSMutableArray alloc] initWithArray:[data objectForKey:@"Students"]];   //insert data to array //9
    [data release];

    
    //studentData = [[NSMutableArray alloc] initWithObjects:@"Ahmad", @"Ali", @"Siti", @"Nabila", @"Azri", @"Hassan", @"Mohd. Razi", nil];
    
    self.navigationItem.title = @"Students";
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addStudent:)] autorelease];
    
    //self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStyleBordered target:self action:@selector(addStudent:)] autorelease];

   }

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated  //13
{
    NSDictionary *data = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    studentData = [[NSMutableArray alloc] initWithArray:[data objectForKey:@"Students"]];
    
    [self.tableView reloadData];    //pggil data source  

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    }

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [studentData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    cell.textLabel.text = [studentData objectAtIndex:indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

- (void)addStudent:(UIBarButtonItem *)button
{
    AddStudentViewController *addStudentViewController = [[[AddStudentViewController alloc] initWithNibName:@"AddStudentViewController" bundle:nil] autorelease];
    [addStudentViewController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentModalViewController:addStudentViewController animated:YES];
}

@end

//
//  FISAddMessageViewController.m
//  slapChat
//
//  Created by Lukas Thoms on 6/29/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISAddMessageViewController.h"
#import "FISDataStore.h"
#import "Message.h"

@interface FISAddMessageViewController ()

@property (weak, nonatomic) IBOutlet UITextField *messageField;
@property (weak, nonatomic) FISDataStore *dataStore;

@end

@implementation FISAddMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataStore = [FISDataStore sharedDataStore];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonTapped:(id)sender {
    
    Message *newMessage = [NSEntityDescription insertNewObjectForEntityForName:@"Message" inManagedObjectContext:self.dataStore.managedObjectContext];
    newMessage.content = self.messageField.text;
    newMessage.createdAt = [NSDate date];
    NSMutableArray *newMessages = [self.dataStore.messages mutableCopy];
    [newMessages addObject:newMessage];
    NSArray *finalMessages = [NSArray arrayWithArray:newMessages];
    self.dataStore.messages = finalMessages;
    [self.dataStore saveContext];
    [self.navigationController popViewControllerAnimated:YES];


}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  LMTAnnotationsViewController.m
//  HackerBooks2
//
//  Created by Luis M Tolosana Simon on 25/4/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

#import "LMTAnnotationsViewController.h"
#import "LMTBook.h"
#import "LMTAnnotation.h"
#import "LMTPhoto.h"
#import "LMTAnnotationViewController.h"

@interface LMTAnnotationsViewController ()

@property (nonatomic, strong) LMTBook *book;

@end

@implementation LMTAnnotationsViewController

#pragma mark - Init
-(id) initWithFetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController style:(UITableViewStyle)aStyle book:(LMTBook *) book{
    
    if (self = [super initWithFetchedResultsController:aFetchedResultsController
                                                 style:aStyle]) {
        
        _book = book;
        self.title = self.book.title;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                       target:self
                                                                       action:@selector(addNewAnnotation:)];
    self.navigationItem.rightBarButtonItem = add;
    
}

-(void) addNewAnnotation:(id) sender{
    
    
    LMTAnnotation *annotation = [LMTAnnotation annotationWithText:@""
                                                             book:self.book
                                                            image:[UIImage imageNamed:@"No_Image_Available"]
                                                          context:self.book.managedObjectContext];
    
    LMTAnnotationViewController *aVC = [[LMTAnnotationViewController alloc] initWithModel:annotation];
    
    [self.navigationController pushViewController:aVC
                                         animated:YES];
    
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LMTAnnotation *annotation = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    static NSString *annotationCellId = @"AnnotationCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:annotationCellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:annotationCellId];
    }
    
    cell.imageView.image = annotation.image.image;
    cell.textLabel.text = annotation.text;
    
    return cell;
    
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        LMTAnnotation *annotation = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [self.fetchedResultsController.managedObjectContext deleteObject:annotation];
    }
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LMTAnnotation *annotation = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    LMTAnnotationViewController *aVC = [[LMTAnnotationViewController alloc] initWithModel:annotation];
    
    [self.navigationController pushViewController:aVC
                                         animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

//
//  ViewController.m
//  RandomAvatarDemo
//
//  Created by Ding on 1/14/16.
//  Copyright © 2016 Ding. All rights reserved.
//

#import "ViewController.h"
#import "RandomAvatar.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;
@property (weak, nonatomic) IBOutlet UIImageView *imageView4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self change:nil];
}

- (IBAction)change:(id)sender {
    
    _imageView1.image = [RandomAvatar randomAvatarWithDotColor:RandomColor backgroundColor:RandomColor diameter:80];
    _imageView2.image = [RandomAvatar randomAvatarWithDotColor:RandomColor backgroundColor:RandomColor diameter:80];
    _imageView3.image = [RandomAvatar randomAvatarWithDotColor:RandomColor backgroundColor:RandomColor diameter:80];
    
    _imageView4.image = [RandomAvatar randomAvatarWithDotColor:RandomColor backgroundColor:RandomColor diameter:200];
    
}



@end

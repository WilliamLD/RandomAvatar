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
    
    _imageView1.image = [RandomAvatar randomAvatarWithDotColor:[UIColor redColor] backgroundColor:[UIColor yellowColor] diameter:80];
    
    _imageView4.image = [RandomAvatar randomAvatarWithDotColor:[UIColor cyanColor] backgroundColor:[UIColor yellowColor] diameter:200];
}

- (IBAction)change:(id)sender {
    
    _imageView1.image = [RandomAvatar randomAvatarWithDotColor:RandomColor backgroundColor:RandomColor diameter:80];
    
    _imageView4.image = [RandomAvatar randomAvatarWithDotColor:RandomColor backgroundColor:RandomColor diameter:200];
}



@end

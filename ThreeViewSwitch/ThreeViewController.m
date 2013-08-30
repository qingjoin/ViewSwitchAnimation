//
//  ThreeViewController.m
//  ThreeViewSwitch
//
//  Created by qingyun on 8/30/13.
//  Copyright (c) 2013 qingyun. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _imageView  = [[UIImageView alloc]init];
    _imageView.frame = CGRectMake(220, 100, 100, 200);
    _imageView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_imageView];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)test1BtnPress:(id)sender
{
    
    //_imageView.frame = CGRectMake(100, 100, 100, 200);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    //animation.fromValue = [NSNumber numberWithFloat:0.09];
    animation.toValue = [NSNumber numberWithFloat:0];
    animation.duration = 1.0;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(hideAnimationStopped)];
    
    [_imageView.layer addAnimation:animation forKey:nil];
    
    
    
    //[UIView setAnimationDelegate:self];
    
    //[UIView beginAnimations:nil context:nil];
    //当动画停止的时候，调用hideAnimationStopped事件
    //[UIView setAnimationDidStopSelector:@selector(animationStop)];
    
    
}

-(void)hideAnimationStopped
{
    NSLog(@"imageViewStop");
    _imageView.frame = CGRectMake(50, 100, 100, 200);
        
}



@end

//
//  ViewController.m
//  ThreeViewSwitch
//
//  Created by qingyun on 8/30/13.
//  Copyright (c) 2013 qingyun. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIPanGestureRecognizer  *panGes = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handelPan:)];
    [self.view addGestureRecognizer:panGes];
    
    //[_threeView.view addGestureRecognizer:panGes];
    
    [self testBtnPress:nil];
	// Do any additional setup after loading the view, typically from a nib.
}


 
//单击方法
-(void)handelSingleTap:(UITapGestureRecognizer*)gestureRecognizer{
    NSLog(@"%s",__FUNCTION__);
    [self performSelector:@selector(singleTap:) withObject:nil afterDelay:0.2];
}
-(void)singleTap:(id)sender{
    NSLog(@"%s",__FUNCTION__);
}


-(void)handelPan:(UIPanGestureRecognizer*)gestureRecognizer{
    
    static CGPoint startPoint;
    static CGPoint center;
    
    if(gestureRecognizer.state == UIGestureRecognizerStateBegan)
    {
        startPoint=[gestureRecognizer locationInView:_threeView.view];
        center=gestureRecognizer.view.center;
    }
    if(gestureRecognizer.state == UIGestureRecognizerStateChanged)
    {
        CGPoint curPo=[gestureRecognizer locationInView:Nil];
        CGFloat x=curPo.x-startPoint.x;
        //CGFloat y=curPo.y-startPoint.y;
        
        //gestureRecognizer.view.center=CGPointMake(center.x+x, center.y+y);
        _threeView.view.center =  CGPointMake(center.x+x, self.view.bounds.size.height/2);
       
        
    }
    if(gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
         
        
        //CATransaction
        CGFloat moveX = 0;
        if(_threeView.view.frame.origin.x >0)
        {
            moveX = _threeView.view.frame.origin.x;
        }
        NSLog(@"move:%f",moveX);
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
        //animation.fromValue = [NSNumber numberWithFloat:0.09];
        animation.toValue = [NSNumber numberWithFloat:0];//移动幅度
        animation.duration = 1.0;
        [UIView setAnimationDelegate:self];
        [UIView beginAnimations:nil context:nil];
        //当动画停止的时候，调用hideAnimationStopped事件
        
        
        [_threeView.view.layer addAnimation:animation forKey:nil];
        CGPoint endPoint = [gestureRecognizer locationInView:Nil];
        CGFloat x=endPoint.x-startPoint.x;
       
        if(_threeView.view.frame.origin.x < 320/2)
        {
            NSLog(@"sssff");
            //_threeView.view.center =  CGPointMake(320/2, self.view.bounds.size.height/2);
        }
        [UIView setAnimationDidStopSelector:@selector(animationStop)];
        NSLog(@"endendendend!");
    }
}


-(void)animationStop
{
    NSLog(@"sssssfffffffff");
    _threeView.view.center =  CGPointMake(320/2, self.view.bounds.size.height/2);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testBtnPress:(id)sender
{
    _twoView = [[TwoViewController alloc]init];
    _twoView.view.backgroundColor = [UIColor redColor];
     _twoView.view.frame = CGRectMake(-320/2, 0, _twoView.view.bounds.size.width, _twoView.view.bounds.size.height);
    [self.view addSubview:_twoView.view];
   
    
    _threeView = [[ThreeViewController alloc]init];
    [self.view addSubview:_threeView.view];
    
    _fourView = [[FourViewController alloc]init];
    _fourView.view.backgroundColor = [UIColor greenColor];
    _fourView.view.frame = CGRectMake(320/2, 0, _fourView.view.bounds.size.width, _fourView.view.bounds.size.height);
    [self.view addSubview:_fourView.view];
    
    [self.view bringSubviewToFront:_threeView.view]; //移到最前面
    
    
    
}



/*
 //创建一个点击手势对象，该对象可以调用handelTap：方法
 UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handelTap:)];
 [self.view addGestureRecognizer:tapGes];
 
 [tapGes setNumberOfTouchesRequired:1];//触摸点个数
 [tapGes setNumberOfTapsRequired:2];//点击次数
 
 
 //创建一个点击手势对象，该对象可以调用handelSingleTap：方法
 UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handelSingleTap:)];
 [self.view addGestureRecognizer:singleTap];
 //[singleTap release];
 [singleTap setNumberOfTouchesRequired:1];//触摸点个数
 [singleTap setNumberOfTapsRequired:1];//点击次数
 */



@end

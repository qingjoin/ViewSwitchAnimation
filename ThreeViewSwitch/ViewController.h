//
//  ViewController.h
//  ThreeViewSwitch
//
//  Created by qingyun on 8/30/13.
//  Copyright (c) 2013 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"


@interface ViewController : UIViewController
{
    TwoViewController *_twoView;
    ThreeViewController *_threeView;
    FourViewController *_fourView;
    
    
}
- (IBAction)testBtnPress:(id)sender;

@end

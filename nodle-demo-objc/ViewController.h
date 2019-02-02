//
//  ViewController.h
//  nodle-demo
//
//  Created by Mikael Sundström on 2019-01-26.
//  Copyright © 2019 Mikael Sundström. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *testView;

- (IBAction)redSliderValueChanged:(id)sender;
- (IBAction)greenSliderValueChanged:(id)sender;
- (IBAction)blueSliderValueChanged:(id)sender;

@end


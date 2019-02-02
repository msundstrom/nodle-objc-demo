#import "ViewController.h"
#import <nodle/nodle.h>

@interface ViewController ()

@property (nonatomic, strong) NSArray *nodes;
@property (nonatomic, strong) RGBNode *rgbNode;
@property (nonatomic, strong) UILayoutGuide *layoutGuide;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _layoutGuide = [[UILayoutGuide alloc] init];
    [self.view addLayoutGuide:self.layoutGuide];
    NSLayoutConstraint *widthConstraint = [self.layoutGuide.widthAnchor constraintEqualToConstant:50.0f];
    [widthConstraint setActive:YES];
    
    NSLayoutConstraint *yPositionConstraint = [self.testView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor];
    [yPositionConstraint setActive:YES];
    
    [[self.testView.widthAnchor constraintEqualToAnchor:self.layoutGuide.widthAnchor] setActive:YES];

    RGBNode *rgbNode = [[RGBNode alloc] init];
    AssembleColorNode *assembleColor = [[AssembleColorNode alloc] init];
    UpdateBackgroundColorNode *updateColor = [[UpdateBackgroundColorNode alloc] initWithView:self.view];
    
    _rgbNode = rgbNode;
    
    [self.rgbNode.rOutput addConnection:assembleColor.rInput];
    [self.rgbNode.gOutput addConnection:assembleColor.gInput];
    [self.rgbNode.bOutput addConnection:assembleColor.bInput];
    
    [assembleColor.colorOutput addConnection:updateColor.colorInput];
    
    _nodes = @[assembleColor, updateColor];
    
    for (NodeInput *input in self.rgbNode.inputs) {
        input.value = @(0.5);
    }
}

- (IBAction)redSliderValueChanged:(id)sender {
    self.rgbNode.rInput.value = @(((UISlider *)sender).value);
}

- (IBAction)greenSliderValueChanged:(id)sender {
    self.rgbNode.gInput.value = @(((UISlider *)sender).value);
}

- (IBAction)blueSliderValueChanged:(id)sender {
    self.rgbNode.bInput.value = @(((UISlider *)sender).value);
}

@end

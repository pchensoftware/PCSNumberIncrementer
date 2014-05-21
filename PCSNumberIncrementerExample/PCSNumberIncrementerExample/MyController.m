//====================================================================================================
// Author: Peter Chen
// Created: 5/21/14
// Copyright 2014 Peter Chen
//====================================================================================================

#import "MyController.h"
#import "PCSNumberIncrementer.h"

@interface MyController()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) PCSNumberIncrementer *incrementer;

@end

@implementation MyController

- (id)init {
   if ((self = [super init])) {
   }
   return self;
}

- (void)viewDidLoad {
   [super viewDidLoad];
   self.title = @"Number Incrementer";
   self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Start" style:UIBarButtonItemStyleDone target:self action:@selector(_startButtonTapped)];
   
   self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 34)];
   self.label.font = [UIFont systemFontOfSize:30];
   self.label.text = @"A Label";
   self.label.textAlignment = NSTextAlignmentCenter;
   [self.view addSubview:self.label];
   
   self.button = [UIButton buttonWithType:UIButtonTypeCustom];
   self.button.frame = CGRectMake(0, 200, self.view.frame.size.width, 34);
   self.button.titleLabel.font = [UIFont systemFontOfSize:30];
   [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
   [self.button setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
   [self.button setTitle:@"A Button" forState:UIControlStateNormal];
   [self.view addSubview:self.button];
}

//====================================================================================================
#pragma mark - Events
//====================================================================================================

- (void)_startButtonTapped {
   PCSNumberIncrementer *incrementer = [[PCSNumberIncrementer alloc] initFromValue:100 toValue:2100];
   [incrementer runIncrementBlock:^(PCSNumberIncrementer *incrementParams) {
      NSString *currentValueString = incrementParams.currentValueString;
      self.label.text = currentValueString;
      [self.button setTitle:currentValueString forState:UIControlStateNormal];
   }];
}

@end

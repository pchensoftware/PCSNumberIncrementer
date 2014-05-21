//====================================================================================================
// Author: Peter Chen
// Created: 5/21/14
// Copyright 2014 Peter Chen
//====================================================================================================

#import <UIKit/UIKit.h>

@class PCSNumberIncrementer;

typedef void(^PCSNumberIncrementerIncrementBlock)(PCSNumberIncrementer *incrementer);

@interface PCSNumberIncrementer : NSObject

@property (nonatomic, assign) int fromValue;
@property (nonatomic, assign) int toValue;
@property (nonatomic, readonly) int currentValue;
@property (nonatomic, readonly) NSString *currentValueString; // [NSString stringWithFormat:@"%d", self.currentValue]
@property (nonatomic, assign) float animationDuration;

- (id)initFromValue:(int)fromValue toValue:(int)toValue;
- (void)runIncrementBlock:(PCSNumberIncrementerIncrementBlock)block;

@end

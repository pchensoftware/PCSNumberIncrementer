//====================================================================================================
// Author: Peter Chen
// Created: 5/21/14
// Copyright 2014 Peter Chen
//====================================================================================================

#import "PCSNumberIncrementer.h"

#define kChangesPerSecond         35
#define kDefaultAnimationDuration 0.5

@interface PCSNumberIncrementer()

@property (nonatomic, assign) int currentValue;
@property (nonatomic, assign) int numberOfChanges;
@property (nonatomic, assign) float incrementBaseValue;
@property (nonatomic, copy) PCSNumberIncrementerIncrementBlock incrementBlock;

@end

@implementation PCSNumberIncrementer

- (id)initFromValue:(int)fromValue toValue:(int)toValue {
   return [self initFromValue:fromValue toValue:toValue animationDuration:kDefaultAnimationDuration];
}

- (id)initFromValue:(int)fromValue toValue:(int)toValue animationDuration:(float)animationDuration {
   if ((self = [super init])) {
      self.fromValue = fromValue;
      self.toValue = toValue;
      self.animationDuration = animationDuration;
      [self _resetIncrementer];
   }
   return self;
}

- (NSString *)currentValueString {
   return [NSString stringWithFormat:@"%d", self.currentValue];
}

- (void)_resetIncrementer {
   self.currentValue = self.fromValue;
   self.numberOfChanges = kChangesPerSecond * self.animationDuration;
   self.incrementBaseValue = ((float) self.toValue - self.fromValue) / self.numberOfChanges;
}

- (void)runIncrementBlock:(PCSNumberIncrementerIncrementBlock)block {
   if (! block)
      return;
   
   self.incrementBlock = block;
   
   [self _increment];
}

- (void)_increment {
   self.incrementBlock(self);
   
   if (self.currentValue == self.toValue)
      return;
   
   float incrementValue = self.incrementBaseValue + arc4random_uniform(2);
   self.currentValue = MIN(self.currentValue + incrementValue, self.toValue);
   [self performSelector:@selector(_increment) withObject:nil afterDelay:(1.0 / kChangesPerSecond)];
}

@end

PCSNumberIncrementer
====================

Easily animate the text of a label or button from one number to another. Example:

```objective-c
PCSNumberIncrementer *incrementer = [[PCSNumberIncrementer alloc] initFromValue:100 toValue:2000];
[incrementer runIncrementBlock:^(PCSNumberIncrementer *incrementParams) {
   [self.label setTitle:incrementParams.currentValueString forState:UIControlStateNormal];
}];
```

![Screenshot](https://raw.githubusercontent.com/pchensoftware/PCSNumberIncrementer/master/Docs/Screenshot.gif)

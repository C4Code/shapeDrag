//
//  C4WorkSpace.m
//  shapeDrag
//
//  Created by Travis Kirton on 12-05-08.
//  Copyright (c) 2012 POSTFL. All rights reserved.
//

#import "C4WorkSpace.h"
#import "MyPad.h"

#define iPodRatio 89.0/250.0

@interface C4WorkSpace ()
-(void)setupRects;
@end

@implementation C4WorkSpace {
    MyPad *mp1, *mp2;
    CGRect iPadPortrait, iPadLandscape, iPodPortait, iPodLandscape;
}

-(void)setup {
    [self setupRects];
    
    mp1 = [MyPad new];
    [mp1 rect:iPadPortrait];
    [mp1 addGesture:PAN name:@"panGesture" action:@"move:"];
    [self.canvas addShape:mp1];
    
    mp2 = [MyPad new];
    [mp2 rect:iPodPortait];
    [mp2 addGesture:PAN name:@"panGesture" action:@"move:"];
    
    [self.canvas addShape:mp2];
}

-(void)setupRects {
    CGSize defaultPortrait = CGSizeMake(76.8, 102.4);
    CGSize defaultLandscape = CGSizeMake(defaultPortrait.height, defaultPortrait.width);
    
    iPadPortrait = CGRectMake(0, 0, defaultPortrait.width, defaultPortrait.height);
    iPodPortait = CGRectMake(0, 0, defaultPortrait.width*iPodRatio, defaultPortrait.height*iPodRatio);
    iPadLandscape = CGRectMake(0, 0, defaultLandscape.width, defaultLandscape.height);
    iPodLandscape = CGRectMake(0, 0, defaultLandscape.width*iPodRatio, defaultLandscape.height*iPodRatio);
}

@end

//
//  AppDelegate.m
//  FlappyBirdClone
//
//  Created by Matthias Gall on 10/02/14.
//  Copyright (c) 2014 Matthias Gall. All rights reserved.
//

#import "AppDelegate.h"
#import "GameViewController.h"
#import <Skillz/Skillz.h>

@interface AppDelegate () <SkillzDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    UIViewController *vc = [[UIViewController alloc] init];
    self.window = [[UIWindow alloc] init];
    
    [self.window setRootViewController:vc];
    [self.window makeKeyAndVisible];
 
    
    [[Skillz skillzInstance] initWithGameId:@"2112"
                                forDelegate:self
                            withEnvironment:SkillzSandbox
                                  allowExit:NO];
    
    [[Skillz skillzInstance] launchSkillz];
    return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark Skillz Delegate
- (SkillzOrientation)preferredSkillzInterfaceOrientation
{
    return SkillzPortrait;
}
-(void)tournamentWillBegin:(NSDictionary *)gameParameters
                withMatchInfo:(SKZMatchInfo *)matchInfo
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    GameViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    
    UIViewController *rootController = [[self window] rootViewController];
    [rootController presentViewController:vc animated:YES completion:nil];
   // [rootController presentViewController:vc animated:YES completion:nil];
}
@end


//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISSentence.h"

@interface FISAppDelegate ()

@end


@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    FISSentence *sentence = [[FISSentence alloc]init];
    [sentence addWord:@""];
    
    return YES;
    [self doWhatever];
}
-(void)doWhatever {
    
}

@end

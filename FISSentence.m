//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Flatiron School on 6/9/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence ()
@property (strong, nonatomic, readwrite) NSString *sentence;
-(void)assembleSentence;
-(BOOL)validWord:(NSString *)word;
-(BOOL)validPunctuation:(NSString *)punctuation;
-(BOOL)validIndex:(NSUInteger)index;
@end

@implementation FISSentence

-(BOOL)validWord:(NSString *)word{
    if (([word length] == 0)||([word isEqual:@" "])){
        return NO;
    }else{
        return YES;
    }

}

-(BOOL)validPunctuation:(NSString *)punctuation{
    NSArray *punctuationArray =@[@".", @"?" ,@",", @";", @":", @"-", @"!"];
    for (NSString *aString in punctuationArray){
        if ([punctuation isEqualToString:aString]){
            return YES;
        }
    }
        return NO;
            }

        
-(BOOL)validIndex:(NSUInteger)index{
    for (NSUInteger i = 0; i <[self.words count]; i++){
        if (index <= i) {
            return YES;
        }
    }
return NO;
}

-(void)addWord:(NSString *)word{
   
    if([self validWord: word]){
        [self.words addObject:word];

    }
       [self assembleSentence];

}

-(void)addWords:(NSArray *)words
withPunctuation:(NSString *)punctuation{
    
    
    if ([self validPunctuation:punctuation]) {
        self.punctuation = punctuation;

    }
   
    for (NSString *stringFromArray in words){
        if ([self validWord:stringFromArray]&&[self.punctuation isEqualToString:punctuation]){
            [self.words addObject:stringFromArray];
        }
    [self assembleSentence];
    }
    return;
}

-(void)removeWordAtIndex:(NSUInteger )index{
        if ([self validIndex: index]) {
            [self.words removeObjectAtIndex:index];
        }
        [self assembleSentence];
    return;
}

-(void)insertWord:(NSString *)word
          atIndex:(NSUInteger)index{
   // NSLog(@"\n\n\n\n\n\n\n\n111%@\n\n\n\n\n\n\n\n\n", self.words);

    if ([self validWord:word]&&[self validIndex:index]){
        [self.words insertObject:word atIndex:index];
    }
    [self assembleSentence];
}

-(void)replacePunctuationWithPunctuation:(NSString *)punctuation{
    if ([self validPunctuation:punctuation]) {
        self.punctuation = punctuation;
    }
    [self assembleSentence]; 
}

-(void)replaceWordAtIndex:(NSUInteger)index
                 withWord:(NSString *)word{
    if([self validIndex:index]&&[self validWord:word]){
        [self.words replaceObjectAtIndex:index withObject:word];
    }
    [self assembleSentence];
}

-(void)assembleSentence{
    self.sentence = [self.words componentsJoinedByString:@" "];
    self.sentence = [self.sentence stringByAppendingFormat:@"%@",self.punctuation];
    
  
}


@end

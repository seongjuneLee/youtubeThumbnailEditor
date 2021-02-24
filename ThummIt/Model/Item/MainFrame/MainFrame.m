//
//  MainFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

#import "MainFrame.h"

@implementation MainFrame

- (id)init{
    self = [super init];
    if(self){
        
    }
    return self;
}

-(id)copyWithZone:(NSZone *)zone{
    
    MainFrame *copied = [super copyWithZone:zone];
    copied.tintColor = self.tintColor;
    copied.backgroundImageName = self.backgroundImageName;
    if (self.itemName) {
        copied.itemName = [NSString stringWithString:self.itemName];
    }

    return copied;
}

-(id)initWithCoder:(NSCoder *)decoder{
    
    if((self = [super initWithCoder:decoder])) {
        self.tintColor = [decoder decodeObjectForKey:@"tintColor"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder{
    
    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.tintColor forKey:@"tintColor"];

}


@end

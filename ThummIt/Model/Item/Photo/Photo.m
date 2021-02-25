//
//  Photo.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/25.
//

#import "Photo.h"

@implementation Photo
-(instancetype)init{
    self = [super init];
    if (self) {
        
        self.baseView = [[UIView alloc] init];
        self.photoImageView = [[UIImageView alloc] init];
        self.baseView.backgroundColor = UIColor.clearColor;
        
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
        
        self.imageData = [decoder decodeObjectForKey:@"imageData"];

    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder{
    
    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.imageData forKey:@"imageData"];

}

@end

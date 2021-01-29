//
//  TemplateManager.h
//  Thummit
//
//  Created by 이성준 on 2020/12/16.
//

#import <Foundation/Foundation.h>
#import "TemplateHeader.h"
NS_ASSUME_NONNULL_BEGIN

@interface TemplateManager : NSObject

-(NSArray *)templateDatas;
+(TemplateManager *)sharedInstance;

@property (strong, nonatomic) NSArray *templatePreviewImages;

@property (nonatomic) NSUInteger templateDataCounts;
@property (nonatomic) NSUInteger templateCounts;

@end

NS_ASSUME_NONNULL_END

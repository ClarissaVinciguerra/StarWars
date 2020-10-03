//
//  CEVPersonController.h
//  SWAPIObjC
//
//  Created by Clarissa Vinciguerra on 10/1/20.
//

#import <Foundation/Foundation.h>
#import "CEVPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface CEVPersonController : NSObject

+ (void) fetchPersonArrayWithCompletion:(void(^)(NSArray <CEVPerson *> *people, NSError *error)) completion;


@end

NS_ASSUME_NONNULL_END

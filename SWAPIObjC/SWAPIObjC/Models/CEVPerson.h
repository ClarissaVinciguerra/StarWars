//
//  CEVPerson.h
//  SWAPIObjC
//
//  Created by Clarissa Vinciguerra on 10/1/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CEVPerson : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString * gender;
@property (nonatomic, readonly) NSInteger height;

-(instancetype) initWithName: (NSString *)name
                      gender:(NSString *)gender
                      height:(NSInteger)height;

@end

@interface CEVPerson (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary;

@end
NS_ASSUME_NONNULL_END

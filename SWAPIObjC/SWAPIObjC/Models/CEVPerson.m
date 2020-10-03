//
//  CEVPerson.m
//  SWAPIObjC
//
//  Created by Clarissa Vinciguerra on 10/1/20.
//

#import "CEVPerson.h"

@implementation CEVPerson

- (instancetype)initWithName:(NSString *)name gender:(NSString *)gender height:(NSInteger)height
{
    self = [super init];
    if (self)
    {
        _name = name;
        _gender = gender;
        _height = height;
    }
    return self;
}

@end

@implementation CEVPerson (JSONConvertable)

-(instancetype) initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[@"name"];
    NSString *gender = dictionary[@"gender"];
    NSInteger height = [dictionary[@"height"]integerValue];
    
    return [self initWithName:name gender:gender height:height];
}

@end

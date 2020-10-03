//
//  CEVPersonController.m
//  SWAPIObjC
//
//  Created by Clarissa Vinciguerra on 10/1/20.
//

#import "CEVPersonController.h"

static NSString * const baseURLString = @"https://swapi.dev/api/";
static NSString * const personEndpoint = @"people";

@implementation CEVPersonController

+ (void)fetchPersonArrayWithCompletion:(void (^)(NSArray<CEVPerson *> *, NSError *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *peopleURL = [baseURL URLByAppendingPathComponent:personEndpoint];
    //append searchterm after appending people
    NSLog(@"FinalURL: %@", peopleURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:peopleURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"There was an error: %@, %@", error, error.localizedDescription);
            return completion(nil, error);
        }
        
        if (!data)
        {
            NSLog(@"There appears to be no data.");
            return completion(nil, error);
        }
      
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options: 2 error:&error];
        
        NSArray *resultsArray = topLevelDictionary[@"results"];
        NSMutableArray *peopleArray = [NSMutableArray array];
        for (NSDictionary *resultsDictionary in resultsArray)
        {
            CEVPerson *person = [[CEVPerson alloc] initWithDictionary:resultsDictionary];
            [peopleArray addObject:person];
        }
        return completion (peopleArray, error);
    }] resume];
}

@end

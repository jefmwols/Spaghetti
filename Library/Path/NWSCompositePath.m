//
//  NWSCompositePath.m
//  Spaghetti
//
//  Copyright (c) 2012 noodlewerk. All rights reserved.
//

#import "NWSCompositePath.h"
#import "NWAbout.h"
#import "NWSSingleKeyPath.h"
#import "NWSIndexPath.h"
#import "NWSKeyPathPath.h"


@implementation NWSCompositePath


#pragma mark - Object life cycle

- (id)initWithPaths:(NSArray *)paths
{
    self = [super init];
    if (self) {
        _paths = paths;
    }
    return self;
}

- (BOOL)isEqual:(NWSCompositePath *)path
{
    return self == path || (self.class == path.class && [self.paths isEqualToArray:path.paths]);
}

- (NSUInteger)hash
{
    NSUInteger result = 1510641772;
    for (NWSPath *path in _paths) {
        result = 31 * result + path.hash;
    }
    return result;
}


#pragma mark - Path

- (id)valueWithObject:(NSObject *)object
{
    NSObject *result = object;
    for (NWSPath *path in _paths) {
        result = [path valueWithObject:result];
        if (!result || result == NSNull.null) {
            // optimize on nil/null
            break;
        }
    }
    return result;
}

- (void)setWithObject:(NSObject *)object value:(id)value
{
    NSObject *o = object;
    NSUInteger i = _paths.count;
    for (NWSPath *path in _paths) {
        if (--i) {
            o = [path valueWithObject:o];
        } else {
            [path setWithObject:o value:value];
        }
        if (!o) {
            break;
        }
    }
}


#pragma mark - Logging

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@:%p #paths:%u>", NSStringFromClass(self.class), self, (int)_paths.count];
}

- (NSString *)about:(NSString *)prefix
{
    NSMutableString *result = [[NSMutableString alloc] init];
    BOOL separator = NO;
    for (NWSPath *path in _paths) {
        if (separator) {
            [result appendString:@"."];
        } else {
            separator = YES;
        }
        [result appendString:[path about:prefix]];
    }
    return result;
}

@end

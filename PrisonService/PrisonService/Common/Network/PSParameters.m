//
// Created by William Zhao on 13-6-26.
// Copyright (c) 2013 Vipshop Holdings Limited. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PSParameters.h"
#import "PSNetConstants.h"

@implementation PSParameters

- (id)init {
    self = [super init];
    if (self) {
        _dictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (id)initWithParameters:(NSString *)parameters {
    self = [self init];
    if (self) {
        if (parameters) {
            NSArray *components = [parameters componentsSeparatedByString:@"&"];
            for (NSString *component in components) {
                NSArray *subComponents = [component componentsSeparatedByString:@"="];
                if ([subComponents count] == 2) {
                    [_dictionary setObject:[subComponents objectAtIndex:1] forKey:[subComponents objectAtIndex:0]];
                }
            }
        }
    }
    return self;
}

- (NSString *)sortedString {
    if ([self count] == 0) return @"";
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *sortedKeys = [[_dictionary allKeys] sortedArrayUsingDescriptors:[NSArray arrayWithObjects:descriptor, nil]];
    NSMutableString *sortString = [NSMutableString stringWithString:@""];
    for (NSString *key in sortedKeys) {
        NSString *value = [_dictionary objectForKey:key];
        [sortString appendString:key];
        [sortString appendString:value];
    }
    return sortString;
}

- (NSString *)buildParameters {
    if ([self count] == 0) return @"";
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *sortedKeys = [[_dictionary allKeys] sortedArrayUsingDescriptors:[NSArray arrayWithObjects:descriptor, nil]];
    NSMutableString *parametersString = [NSMutableString stringWithString:@""];
    for (NSString *key in sortedKeys) {
        NSString *value = [_dictionary objectForKey:key];
        if ([parametersString length] != 0) {
            [parametersString appendString:@"&"];
        }
        [parametersString appendString:key];
        [parametersString appendString:@"="];
        [parametersString appendString:value];
    }
    return parametersString;
}

- (NSDictionary*)dictionary {
    return _dictionary;
}

- (NSInteger)count {
    return [_dictionary count];
}

- (BOOL)isEqualToParameters:(NSString *)parameters {
    return [[self buildParameters] isEqualToString:parameters];
}

@end

@implementation PSMutableParameters

- (void)addParameter:(id)value forKey:(NSString *)key {
    if (!key) {
        @throw [NSException exceptionWithName:@"Error" reason:@"key for addParameter:forKey: is nil" userInfo:nil];
    }
    if (!value) {
        return;
    }
    [_dictionary setObject:value forKey:key];
}

-(id)getParameter:(NSString *)key{
    if (!key) {
        @throw [NSException exceptionWithName:@"Error" reason:@"key for removeParameter: is nil" userInfo:nil];
    }
 
    return [_dictionary objectForKey:key];
    
}

- (void)removeParameter:(NSString *)key {
    if (!key) {
        @throw [NSException exceptionWithName:@"Error" reason:@"key for removeParameter: is nil" userInfo:nil];
    }
    [_dictionary removeObjectForKey:key];
}

- (void)clearAllParameter {
    _dictionary = [[NSMutableDictionary alloc] init];
}

@end

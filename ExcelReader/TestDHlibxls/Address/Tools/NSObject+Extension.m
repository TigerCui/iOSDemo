//
//  NSObject+Extension.m
//  TestDHlibxls
//
//  Created by 崔正清 on 2019/3/27.
//

#import "NSObject+Extension.h"
#import <MJExtension/MJExtension.h>
#import "NSString+Extension.h"

@implementation NSObject (Extension)

- (NSString *)json {
    NSString *_json = objc_getAssociatedObject(self, @selector(json));
    if (!_json) {
        id data;
        if ([self isKindOfClass:[NSArray class]]) {
            data = [NSArray mj_keyValuesArrayWithObjectArray:(NSArray *)self];
        } else {
            data = self.mj_keyValues;
        }
        _json = ((NSObject *)data).mj_JSONString;
        objc_setAssociatedObject(self, @selector(json), _json, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return _json;
}

@end

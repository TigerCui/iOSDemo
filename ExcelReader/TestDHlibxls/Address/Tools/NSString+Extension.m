//
//  NSString+Extension.m
//  TestDHlibxls
//
//  Created by 崔正清 on 2019/3/27.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

/**
 *  删除小数点
 */
- (NSString *)delDot {
    if ([self containsString:@"."]) {
        NSArray <NSString *> *tempArray = [self componentsSeparatedByString:@"."];
        return tempArray.firstObject;
    } else {
        return self;
    }
}

//+ (NSString *)convertToJsonData:(NSData *)jsonData {
////    NSError *error;
////    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:&error];
//    NSString *jsonString;
//    if (!jsonData) {
//        NSLog(@"%@",error);
//    }else{
//        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
//    }
//    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
//    NSRange range = {0,jsonString.length};
//    //去掉字符串中的空格
//    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
//    NSRange range2 = {0,mutStr.length};
//    //去掉字符串中的换行符
//    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
//    return mutStr;
//}

@end

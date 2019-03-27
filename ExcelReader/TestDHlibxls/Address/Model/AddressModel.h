//
//  AddressModel.h
//  TestDHlibxls
//
//  Created by 崔正清 on 2019/3/27.
//

#import <Foundation/Foundation.h>


@interface AddressModel : NSObject

@property (nonatomic, strong) NSString *code;//编码
@property (nonatomic, strong) NSString *type;//类型
@property (nonatomic, strong) NSString *name;//名称
@property (nonatomic, strong) NSString *superCode;//父类编号
@property (nonatomic, copy) NSArray <AddressModel *> *subAddress;//下级地址

@end


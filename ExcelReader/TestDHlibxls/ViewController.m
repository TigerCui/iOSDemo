//
//  ViewController.m
//  TestDHlibxls
//
//  Created by David Hoerl on 1/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "DHxlsReader.h"
#import "AddressModel.h"
#import "NSString+Extension.h"
#import "NSObject+Extension.h"
#import <MJExtension/MJExtension.h>

#import "YPProvince.h"
#import "YPCity.h"
#import "YPDistrict.h"

extern int xls_debug;

@implementation ViewController
{
	IBOutlet UITextView *textView;
}

static NSString *kDocumentPath = @"/Users/cuizhengqing/Desktop/city.json";

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

	NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"省市区.xls"];
	DHxlsReader *reader = [DHxlsReader xlsReaderWithPath:path];
	assert(reader);
    
    NSMutableArray *addressList = [NSMutableArray new];
    int row = 2;
    while(YES) {
        @autoreleasepool {
            AddressModel *address = [AddressModel new];
            DHcell *indexCell = [reader cellInWorkSheetIndex:0 row:row col:1];//序号
            if(indexCell.type == cellBlank) break;
            DHcell *codeCell = [reader cellInWorkSheetIndex:0 row:row col:2];
            DHcell *typeCell = [reader cellInWorkSheetIndex:0 row:row col:3];
            DHcell *nameCell = [reader cellInWorkSheetIndex:0 row:row col:4];
            DHcell *superCodeCell = [reader cellInWorkSheetIndex:0 row:row col:5];
            
            address.code = codeCell.str.delDot;
            address.type = typeCell.str.delDot;
            address.name = nameCell.str;
            address.superCode = superCodeCell.str.delDot;
            [addressList addObject:address];
            
            row++;
        }
    }
    
    NSMutableArray <YPProvince *> *newProvinceList = [NSMutableArray new];
    //构造省
    NSPredicate *provinceP = [NSPredicate predicateWithFormat:@"code ENDSWITH '0000'"];
    NSArray <AddressModel *> *provinceList = [addressList filteredArrayUsingPredicate:provinceP];
    if (provinceList.count) {
        //构造市
        for (AddressModel *province in provinceList) {
            @autoreleasepool {
                //构造新省列表
                YPProvince *newProvince = [YPProvince new];
#if MATCH
                newProvince.ID = province.code.integerValue;
#else
                newProvince.ID = province.code;
#endif
                
                newProvince.n = province.name;
                NSPredicate *cityP = [NSPredicate predicateWithFormat:@"superCode == %@",province.code];
                NSArray <AddressModel *> *cityList = [addressList filteredArrayUsingPredicate:cityP];
                if (cityList.count) {
                    NSMutableArray <YPCity *> *newCityList = [NSMutableArray new];
                    //构造区
                    for (AddressModel *city in cityList) {
                        //构造新市列表
                        YPCity *newCity = [YPCity new];
#if MATCH
                        newCity.ID = city.code.integerValue;
#else
                        newCity.ID = city.code;
#endif
                        
                        newCity.n = city.name;
                        NSPredicate *districtP = [NSPredicate predicateWithFormat:@"superCode == %@",city.code];
                        NSArray <AddressModel *> *districtList = [addressList filteredArrayUsingPredicate:districtP];
                        if (districtList) {
                            NSMutableArray <YPDistrict *> *newDistrictList = [NSMutableArray new];
                            for (AddressModel *district in districtList) {
                                //构造新区列表
                                YPDistrict *newDistrict = [YPDistrict new];
#if MATCH
                                newDistrict.ID = district.code.integerValue;
#else
                                newDistrict.ID = district.code;
#endif
                                newDistrict.n = district.name;
                                [newDistrictList addObject:newDistrict];
                            }
                            newCity.d = newDistrictList;
                        }
                        [newCityList addObject:newCity];
                    }
                    newProvince.c = newCityList;
                }
                [newProvinceList addObject:newProvince];
            }
        }
    }

    NSString *jsonStr = [self dealNoDistrictWithNewProvinceList:newProvinceList].json;
    
    [self createFile];
    [self writeFileWithContent:jsonStr];
    NSLog(@"");
    
}

//处理区是空的情况
- (NSArray *)dealNoDistrictWithNewProvinceList:(NSMutableArray <YPProvince *> *)newProvinceList {
    for (YPProvince *province in newProvinceList) {
        for (YPCity *city in province.c) {
            if (!city.d.count) {
                YPDistrict *d = [YPDistrict new];
                d.ID = city.ID;
                d.n = city.n;
                city.d = @[d];
            }
        }
    }
    return [newProvinceList copy];
}

-(void)createFile{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *iOSPath = kDocumentPath;
    BOOL isSuccess = [fileManager createFileAtPath:iOSPath contents:nil attributes:nil];
    if (isSuccess) {
        NSLog(@"文件创建成功");
    } else {
        NSLog(@"文件创建失败");
        assert(1);
    }
}

-(void)writeFileWithContent:(NSString *)content{
    NSString *iOSPath = kDocumentPath;
    BOOL isSuccess = [content writeToFile:iOSPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    if (isSuccess) {
        NSLog(@"文件写入成功");
    } else {
        NSLog(@"文件写入失败");
        assert(1);
    }
}

- (void)viewDidUnload
{
	textView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end

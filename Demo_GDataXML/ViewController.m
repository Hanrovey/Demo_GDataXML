//
//  ViewController.m
//  Demo_GDataXML
//
//  Created by Hanrovey on 2017/6/27.
//  Copyright © 2017年 Hanrovey. All rights reserved.
//

#import "ViewController.h"
#import "GDataXMLNode.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取xml文件
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:filePath];
    
    // 初始化xmlDoc 文件
    GDataXMLDocument *xmlDoc = [[GDataXMLDocument alloc] initWithData:xmlData error:nil];
    
    // 获取根节点
    GDataXMLElement *rootElement = [xmlDoc rootElement];
    
    // 获取根节点下的节点(user)
    NSArray *users = [rootElement elementsForName:@"User"];
    
    for (GDataXMLElement *user in users) {
        
        // 获取user的id属性
        NSString *userID = [[user attributeForName:@"id"] stringValue];
        NSLog(@"userID : %@",userID);
        
        // 获取节点name的值
        GDataXMLElement *nameElement = [[user elementsForName:@"name"] objectAtIndex:0];
        NSString *name = [nameElement stringValue];
        NSLog(@"name : %@",name);
        
        // 获取节点age的值
        GDataXMLElement *ageElement = [[user elementsForName:@"age"] objectAtIndex:0];
        NSString *age = [ageElement stringValue];
        NSLog(@"age : %@",age);
        
        NSLog(@"><><><><><><><><><><><><<");
        
    }
    
}



@end

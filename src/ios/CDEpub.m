//
//  CDEpub.m
//  手机学堂
//
//  Created by MacBookPro on 2017/9/13.
//
//

#import "CDEpub.h"
#import "EPUBParser.h"
#import "EPUBReadMainViewController.h"

@interface CDEpub ()
@property (strong, nonatomic) EPUBParser *epubParser; //epub解析器，成员变量或全局

@end
@implementation CDEpub
-(void)readEpub:(CDVInvokedUrlCommand *)command {
    
    _epubParser=[[EPUBParser alloc] init];

    NSString *path = [command argumentAtIndex:0] ?[command argumentAtIndex:0] : @"";
    
    NSString *userID = [command argumentAtIndex:1] ?[command argumentAtIndex:1] : @"";
    
    NSString *bookID = [command argumentAtIndex:2] ?[command argumentAtIndex:2] : @"";
    
//    if(!userID) {
//        //第二张第五节
//        userID = @"Wilson";
//        //第二张第四节
////        userID = @"Vera";
//    }
//    
//    if(!bookID) {
//        //第二章第五节
//        bookID = @"fsqwrasdfa123";
//        //第二章第四节
////        bookID = @"fsqwrasdfa456";
//    }
    
    __block CDVPluginResult *result = nil;

    if (path && ([path hasSuffix:@".epub"] || [path hasSuffix:@".EPUB"])) {
        NSMutableDictionary *fileInfo=[NSMutableDictionary dictionary];
        [fileInfo setObject:path forKey:@"fileFullPath"];
        [fileInfo setObject:userID forKey:@"userID"];
        [fileInfo setObject:bookID forKey:@"bookID"];
        
        EPUBReadMainViewController *epubVC=[EPUBReadMainViewController new];
        epubVC.epubParser=self.epubParser;
        epubVC.fileInfo=fileInfo;
        
        epubVC.epubReadBackBlock=^(NSMutableDictionary *para1){
            NSLog(@"回调=%@",para1);
            //[self dismissViewControllerAnimated:YES completion:nil];  //a方式  oK
            //[self.navigationController popToRootViewControllerAnimated:YES];    //b方式  oK
            [self.viewController dismissViewControllerAnimated:NO completion:nil];
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            __weak __typeof(self) weakSelf = self;
            [self.commandDelegate runInBackground:^{
                [weakSelf.commandDelegate sendPluginResult:result callbackId:command.callbackId];
            }];
            return 1;
        };
        
        //[self showViewController:epubVC sender:nil];  //a方式  oK
        //[self.navigationController pushViewController:epubVC animated:YES];  //b方式  oK
        [self.viewController presentViewController:epubVC animated:NO completion:nil];
    } else {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
}
@end

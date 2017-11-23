//
//  ProtocalPacket.h
//  alpha1s
//
//  Created by juntian on 15/2/2.
//  Copyright (c) 2015年 ubtechinc. All rights reserved.
//
//  旧版本协议

#import <Foundation/Foundation.h>

@interface ProtocalPacket : NSObject

// 获取解码后的数据
-(Byte*) getRawData:(int*)pLen;
-(BOOL) setData:(Byte) data;
-(void) setCmd:(Byte)cmd;
-(void) setParam:(Byte*)pParam lens:(int) len;
-(Byte*) packetData:(int *)pLen;

-(Byte) getCmd;
-(Byte*) getParams;
-(int) getParamLen;
- (NSData *)getParamData;

-(Byte*) packetData :(int *)pLen head:(Byte)head;

- (BOOL)parseData:(NSData *)data ;

@end

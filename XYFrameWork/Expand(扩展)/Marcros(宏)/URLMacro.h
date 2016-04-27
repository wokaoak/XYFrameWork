//
//  URLMarcro.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/4/22.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#ifndef URLMacro_h
#define URLMacro_h

#define __FINALSERVER__
#ifdef __FINALSERVER__
//正式服务器
#define ServerURL @"http://wthrcdn.etouch.cn"
#define Community_ServerURL @"http://im.saodianhou.com/"//社区
#define ImageURL @"http://sdhimg.image.alimmdn.com/"

#else
//测试服务器
#define ServerURL @"http://test-sdh.saodianhou.com/"
#define Community_ServerURL @"http://182.92.164.223:5085/"//社区
#define ImageURL @"http://sdhimg.image.alimmdn.com/"
#endif

#endif /* URLMacro_h */

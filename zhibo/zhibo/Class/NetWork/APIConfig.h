//
//  APIConfig.h
//  bjsxt-inke
//
//  Created by 孙涛 on 2017/4/24.
//  Copyright © 2017年 孙涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIConfig : NSObject

//信息类服务器地址
#define SERVER_HOST @"http://service.inke.com"

//图片服务器地址
#define IMAGE_HOST @"http://img.meelive.cn/"


//热门直播
#define API_HotLive @"api/live/simpleall"
//@"http://service.inke.com/api/live/simpleall"

#define Live_Dahuan @"rtmp://live.hkstv.hk.lxdns.com:1935/live/dahuan"


//GET /api/live/near_flow_old?&gender=1&gps_info=126.610835%2C45.711076&loc_info=CN%2C%E9%BB%91%E9%BE%99%E6%B1%9F%E7%9C%81%2C%E5%93%88%E5%B0%94%E6%BB%A8%E5%B8%82&is_new_user=0&lc=0000000000000053&cc=TG0001&cv=IK4.0.30_Iphone&proto=7&idfa=14390324-A1EC-4746-8743-A6BA53921C4D&idfv=012372C7-1877-464C-A971-7CA41554D5B3&devi=b139da85e05bf5c8957ea6eda7379afbd711d93c&osversion=ios_10.300000&ua=iPhone8_1&imei=&imsi=&uid=107020648&sid=20TLccV62mo9xVzv9XNvEpt7t1g50Ypm2Ed4TJ3hWAphpuJ1i0J&conn=unknow&mtid=&mtxid=&logid=186,166,205,208&latitude=45.711076&longitude=126.610835&multiaddr=1&interest=0&s_sg=3c94a78cf42614d9e2e439b418da3d5a&s_sc=100&s_st=1493265008 HTTP/1.1
//附近的人
//126.6146033
//45.7150614
#define API_NearLive @"api/live/near_flow_old"//?uid=107020648&latitude=45.7150614&longitude=126.6146033
//              @"latitude":@"45.710358",@"longitude":@"126.610549"

//@"http://service.inke.com/api/live/near_flow_old"
//#define API_NearLive @"api/live/near_recommend" //?uid=85149891&latitude=40.090562&longitude=116.413353
//@"http://service.inke.com//api/live/near_flow_old?&gender=1&gps_info=200%2C200&loc_info=&is_new_user=0&lc=0000000000000053&cc=TG0001&cv=IK4.0.30_Iphone&proto=7&idfa=14390324-A1EC-4746-8743-A6BA53921C4D&idfv=012372C7-1877-464C-A971-7CA41554D5B3&devi=b139da85e05bf5c8957ea6eda7379afbd711d93c&osversion=ios_10.300000&ua=iPhone8_1&imei=&imsi=&uid=107020648&sid=20TLccV62mo9xVzv9XNvEpt7t1g50Ypm2Ed4TJ3hWAphpuJ1i0J&conn=wifi&mtid=66808e327dc79d135ba18e051673d906&mtxid=282cb2898be6&logid=186,166,205,208&latitude=200&longitude=200&multiaddr=1&interest=0&s_sg=640f9b2ff9ed5c0834f3c38b8195be60&s_sc=100&s_st=1493074961 HTTP/1.1


//广告地址
#define API_Advertise @"advertise/get"



//http://service.inke.com/api/live/simpleall?&gender=1&gps_info=200%2C200&loc_info=&is_new_user=0&lc=0000000000000053&cc=TG0001&cv=IK4.0.30_Iphone&proto=7&idfa=14390324-A1EC-4746-8743-A6BA53921C4D&idfv=012372C7-1877-464C-A971-7CA41554D5B3&devi=b139da85e05bf5c8957ea6eda7379afbd711d93c&osversion=ios_10.300000&ua=iPhone8_1&imei=&imsi=&uid=107020648&sid=20TLccV62mo9xVzv9XNvEpt7t1g50Ypm2Ed4TJ3hWAphpuJ1i0J&conn=wifi&mtid=66808e327dc79d135ba18e051673d906&mtxid=282cb2898be6&logid=186,166,205,208&s_sg=228f4f0ac793f1836050626b68bde6c9&s_sc=100&s_st=1493074961 HTTP/1.1"
//热门滚动广告
//http://img2.inke.cn/MTQ5MzAwMjQ4OTQ5MiMzNTgjanBn.jpg
//附近的人图片服务器地址
//http://image.scale.inke.com/imageproxy2/dimgm/scaleImage?url=http%3A%2F%2Fimg2.inke.cn%2FMTQ5MDMzMzQ1MDY1MSM5MDEjanBn.jpg&w=-1&s=80&h=-1&c=0&o=1&l=0
//热门直播图片
//http://image.scale.inke.com/imageproxy2/dimgm/scaleImage?url=http%3A%2F%2Fimg2.inke.cn%2FMTQ4OTYyNjAwMTg5NSM2MDkjanBn.jpg&w=72&s=80&h=72&c=0&o=0

//信息类服务器地址
//service.inke.com
//http://service.inke.com/api/live/simpleall?&gender=1&gps_info=200%2C200&loc_info=&is_new_user=0&lc=0000000000000053&cc=TG0001&cv=IK4.0.30_Iphone&proto=7&idfa=14390324-A1EC-4746-8743-A6BA53921C4D&idfv=012372C7-1877-464C-A971-7CA41554D5B3&devi=b139da85e05bf5c8957ea6eda7379afbd711d93c&osversion=ios_10.300000&ua=iPhone8_1&imei=&imsi=&uid=107020648&sid=20TLccV62mo9xVzv9XNvEpt7t1g50Ypm2Ed4TJ3hWAphpuJ1i0J&conn=wifi&mtid=66808e327dc79d135ba18e051673d906&mtxid=282cb2898be6&logid=186,166,205,208&s_sg=228f4f0ac793f1836050626b68bde6c9&s_sc=100&s_st=1493074961 HTTP/1.1
//http://218.11.0.112
//http://218.60.113.17

@end

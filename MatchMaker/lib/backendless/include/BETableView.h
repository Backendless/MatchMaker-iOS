//
//  BETableView.h
//  backendlessAPI
//
//  Created by Yury Yaschenko on 10/30/13.
//  Copyright (c) 2013 BACKENDLESS.COM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BackendlessDataQuery, BackendlessCollection, Fault, BackendlessGeoQuery;
@interface BETableView : UITableView

-(id)getDataForIndexPath:(NSIndexPath *)indexPath;

-(void)find:(Class)className dataQuery:(BackendlessDataQuery *)dataQuery;
-(void)find:(Class)className dataQuery:(BackendlessDataQuery *)dataQuery responder:(id)responder;
-(void)find:(Class)className dataQuery:(BackendlessDataQuery *)dataQuery response:(void(^)(BackendlessCollection *))responseBlock error:(void(^)(Fault *))errorBlock;

-(void)getPoints:(BackendlessGeoQuery *)query;
-(void)relativeFind:(BackendlessGeoQuery *)query;
-(void)getPoints:(BackendlessGeoQuery *)query responder:(id)responder;
-(void)relativeFind:(BackendlessGeoQuery *)query responder:(id)responder;
-(void)getPoints:(BackendlessGeoQuery *)query response:(void(^)(BackendlessCollection *))responseBlock error:(void(^)(Fault *))errorBlock;
-(void)relativeFind:(BackendlessGeoQuery *)query response:(void(^)(BackendlessCollection *))responseBlock error:(void(^)(Fault *))errorBlock;

-(void)nextPage;
-(void)nextPageAsync:(id)responder;
-(void)nextPageAsync:(void(^)(BackendlessCollection *))responseBlock error:(void(^)(Fault *))errorBlock;

-(void)removeAllObjects;
@end

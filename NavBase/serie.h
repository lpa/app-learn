//
//  serie.h
//  NavBase
//
//  Created by Laurent on 27/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Serie : NSObject {
  
  NSString *title;
  NSURL *url;
  NSString *description;

}

@property (nonatomic,retain) NSString *title;
@property (nonatomic,retain) NSURL *url;
@property (nonatomic,retain) NSString *description;

- (id) initWithDictionaryFromPlist: (NSDictionary *) dictionnary;

@end

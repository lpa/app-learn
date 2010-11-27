//
//  serie.m
//  NavBase
//
//  Created by Laurent on 27/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Serie.h"


@implementation Serie

@synthesize title;
@synthesize url;
@synthesize description;

- (id) initWithDictionaryFromPlist: (NSDictionary *) dictionnary {
  [self init];
  
  self.title = [dictionnary objectForKey:@"title"];
  self.url = [NSURL URLWithString:[dictionnary objectForKey:@"url"]];
  self.description = [dictionnary objectForKey:@"description"];
  
  return self;
}

- (void)dealloc {
  [title release];
  [url release];
  [description release];
  [super dealloc];
}
  




@end

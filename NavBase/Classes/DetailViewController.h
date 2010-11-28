//
//  DetailViewController.h
//  NavBase
//
//  Created by Laurent on 28/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Serie.h"


@interface DetailViewController : UIViewController {
	IBOutlet UITextView *descriptionTextView;
	IBOutlet UIWebView *webView;
	Serie *sr;
}

@property (nonatomic,retain) UIWebView *webView;
@property (nonatomic,retain) UITextView *descriptionTextView;
@property (nonatomic,retain) Serie *sr;

@end

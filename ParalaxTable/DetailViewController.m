//
//  DetailViewController.m
//  ParalaxTable
//
//  Created by Kristy on 02.04.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "DetailViewController.h"
#import "KASlideShow.h"

@interface DetailViewController ()

@property (nonatomic,strong) NSArray *detailPhotos;


@end

@implementation DetailViewController

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
    }
}

- (void)configureView {
    if (self.detailItem) {
        
        self.detailSummary.text = self.detailItem.summary;
        
        
    }
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self configureView];
    
    self.detailPhotos = @[[UIImage imageNamed:@"test1.jpg"],
                          [UIImage imageNamed:@"test2.jpg"],
                          [UIImage imageNamed:@"test3.jpg"],
                          [UIImage imageNamed:@"test4.jpg"],
                          [UIImage imageNamed:@"test5.jpg"],
                          [UIImage imageNamed:@"test6.jpg"],
                          [UIImage imageNamed:@"test7.jpg"],
                          [UIImage imageNamed:@"test8.jpg"],
                          [UIImage imageNamed:@"test9.jpg"]];
    
    UIScrollView *scr=[[UIScrollView alloc] initWithFrame:CGRectMake(0,64, 400, 200)];
    scr.tag = 1;
    scr.autoresizingMask=UIViewAutoresizingNone;
    [self.view addSubview:scr];
    [self setupScrollView:scr];
    
}

- (void)setupScrollView:(UIScrollView*)scrMain {
    // we have 10 images here.
    // we will add all images into a scrollView & set the appropriate size.
    
    for (int i=0; i<self.detailPhotos.count; i++) {
        // create image
        UIImage *image = [self.detailPhotos objectAtIndex:i];
        // create imageView
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake((i-1)*scrMain.frame.size.width, 0, scrMain.frame.size.width, scrMain.frame.size.height)];
        // set scale to fill
        imgV.contentMode=UIViewContentModeScaleToFill;
        // set image
        [imgV setImage:image];
        // apply tag to access in future
        imgV.tag=i+1;
        // add to scrollView
        [scrMain addSubview:imgV];
    }
    // set the content size to 10 image width
    [scrMain setContentSize:CGSizeMake(scrMain.frame.size.width*10, scrMain.frame.size.height)];
    // enable timer after each 2 seconds for scrolling.
}



    
//    self.scrollViewForGallery.tag = 1;
//    self.scrollViewForGallery.autoresizingMask=UIViewAutoresizingNone;
//    
//    [self.view addSubview:self.viewForGallery];
//    
//    [self.viewForGallery addSubview:self.scrollViewForGallery];
//    
//    [self setupScrollView:self.scrollViewForGallery];
//    
//    [self.pgControl setTag:12];
//    self.pgControl.numberOfPages=10;
//    self.pgControl.autoresizingMask=UIViewAutoresizingNone;
//    [self.viewForGallery addSubview:self.pgControl];
//}
//
//
//
//- (void)setupScrollView:(UIScrollView*)scrMain {
//    // we have 10 images here.
//    // we will add all images into a scrollView & set the appropriate size.
//    
//    for (int i=0; i<=self.detailPhotos.count; i++) {
//        // create image
//        
//        
//        self.imageForGallery.image = [UIImage imageNamed:[NSString stringWithFormat:@"test1.jpg"]];
//    
//        // apply tag to access in future
//        self.imageForGallery.tag=i+1;
//        // add to scrollView
//        [scrMain addSubview:self.imageForGallery];
//    }
//    // set the content size to 10 image width
//    [scrMain setContentSize:CGSizeMake(scrMain.frame.size.width * self.detailPhotos.count, scrMain.frame.size.height)];
//    // enable timer after each 2 seconds for scrolling.
//    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollingTimer) userInfo:nil repeats:YES];
//}
//
//
//
//- (void)scrollingTimer {
//    // access the scroll view with the tag
//    UIScrollView *scrMain = (UIScrollView*) [self.view viewWithTag:1];
//    // same way, access pagecontroll access
//    UIPageControl *pgCtr = (UIPageControl*) [self.view viewWithTag:12];
//    // get the current offset ( which page is being displayed )
//    CGFloat contentOffset = scrMain.contentOffset.x;
//    // calculate next page to display
//    int nextPage = (int)(contentOffset/scrMain.frame.size.width) + 1 ;
//    // if page is not 10, display it
//    if( nextPage!=9 )  {
//        [scrMain scrollRectToVisible:CGRectMake(nextPage*scrMain.frame.size.width, 0, scrMain.frame.size.width, scrMain.frame.size.height) animated:YES];
//        pgCtr.currentPage=nextPage;
//        // else start sliding form 1 :)
//    } else {
//        [scrMain scrollRectToVisible:CGRectMake(0, 0, scrMain.frame.size.width, scrMain.frame.size.height) animated:YES];
//        pgCtr.currentPage=0;
//    }
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

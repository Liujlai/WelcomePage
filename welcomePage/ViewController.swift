//
//  ViewController.swift
//  welcomePage
//
//  Created by idea_liujl on 17/7/7.
//  Copyright © 2017年 idea_liujl. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate{
    var scrollView=UIScrollView()
    var pageControl=UIPageControl()
    var btn = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pageControl.center = CGPointMake(self.view.frame.width/2,self.view.frame.height-30)
        pageControl.currentPageIndicatorTintColor=UIColor.redColor()
        pageControl.pageIndicatorTintColor = UIColor.whiteColor()
        pageControl.numberOfPages = 7
        pageControl.addTarget(self, action: "scrollViewDidEndDecelerating", forControlEvents: UIControlEvents.ValueChanged)
        
        
        
        
        scrollView.frame=self.view.bounds
        scrollView.contentSize = CGSizeMake(7*self.view.frame.width, 0)
        scrollView.pagingEnabled=true
        scrollView.bounces=false
        scrollView.showsHorizontalScrollIndicator=false
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        for i in 0...7{
            print(i)
            let image=UIImage(named: "\(i+1)")
            let imageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
            imageView.image=image
            var frame=imageView.frame
            frame.origin.x = CGFloat(i)*frame.size.width
            imageView.frame = frame
            scrollView.addSubview(imageView)
            self.view.addSubview(pageControl)
        }
        
        
        
        
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x/self.view.frame.size.width)
        pageControl.currentPage = index
        if(index == 6){
            self.btn.frame=CGRectMake(6*self.view.frame.width, self.view.frame.size.height, self.view.frame.width, 50)
            self.btn.setTitle("点击进入", forState: UIControlState.Normal)
            self.btn.titleLabel?.font=UIFont.systemFontOfSize(20)
            self.btn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
            self.btn.backgroundColor = UIColor.orangeColor()
            self.btn.alpha=0
            self.btn.addTarget(self, action: "buttonClick:", forControlEvents: UIControlEvents.TouchUpInside)
            
            
            
            UIView.animateWithDuration(1.5, delay: 0.5, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.btn.frame=CGRectMake(6*self.view.frame.width, self.view.frame.height-100, self.view.frame.width, 50)
                self.btn.alpha = 1
                self.scrollView.addSubview(self.btn)
                }, completion:nil)
        }
    }
    func buttonClick(button:UIButton){
        let sb=UIStoryboard(name: "Main", bundle: nil)
        let second = sb.instantiateViewControllerWithIdentifier("second") as! UIViewController
        self.presentViewController(second, animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


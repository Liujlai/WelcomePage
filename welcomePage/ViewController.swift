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
       
        pageControl.center = CGPoint(x: self.view.frame.width/2,y: self.view.frame.height-30)
        pageControl.currentPageIndicatorTintColor=UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.numberOfPages = 7
        pageControl.addTarget(self, action: "scrollViewDidEndDecelerating", for: UIControlEvents.valueChanged)
        
        
       
        scrollView.frame=self.view.bounds
        scrollView.contentSize = CGSize(width: 7*self.view.frame.width, height: 0)
        scrollView.isPagingEnabled=true
        scrollView.bounces=false
        scrollView.showsHorizontalScrollIndicator=false
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        for i in 0...7{
            print(i)
            let image=UIImage(named: "\(i+1)")
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
            imageView.image=image
            var frame=imageView.frame
            frame.origin.x = CGFloat(i)*frame.size.width
            imageView.frame = frame
            scrollView.addSubview(imageView)
            self.view.addSubview(pageControl)
        }
        
        
        
        
    }
  
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x/self.view.frame.size.width)
        pageControl.currentPage = index
        if(index == 6){
            self.btn.frame=CGRect(x: 6*self.view.frame.width, y: self.view.frame.size.height, width: self.view.frame.width, height: 50)
            self.btn.setTitle("点击进入", for: UIControlState())
            self.btn.titleLabel?.font=UIFont.systemFont(ofSize: 20)
            self.btn.setTitleColor(UIColor.gray, for: UIControlState.highlighted)
            self.btn.backgroundColor = UIColor.orange
            self.btn.alpha=0
            self.btn.addTarget(self, action: #selector(ViewController.buttonClick(_:)), for: UIControlEvents.touchUpInside)
            
           
            UIView.animate(withDuration: 1.5, delay: 0.5, options: UIViewAnimationOptions(), animations: { () -> Void in
                self.btn.frame=CGRect(x: 6*self.view.frame.width, y: self.view.frame.height-100, width: self.view.frame.width, height: 50)
                self.btn.alpha = 1
                self.scrollView.addSubview(self.btn)
                }, completion:nil)
        }
    }
    func buttonClick(_ button:UIButton){
        let sb=UIStoryboard(name: "Main", bundle: nil)
        let second = sb.instantiateViewController(withIdentifier: "second") 
        self.present(second, animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


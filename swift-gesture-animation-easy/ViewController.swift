//
//  ViewController.swift
//  swift-gesture-animation-easy
//
//  Created by Hiromasa Nagamine on 5/31/15.
//  Copyright (c) 2015 hiro nagami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var leftFrame: UIView!
    var rightFrame: UIView!
    var rect:UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        configureViews()
        configureGestures()
//        callAnimation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func configureViews()
    {
        leftFrame = UIView(frame: CGRectMake(0, 0, 80, 80))
        leftFrame.layer.borderColor = UIColor.lightGrayColor().CGColor
        leftFrame.layer.borderWidth = 1.0
        leftFrame.center = CGPointMake(self.view.center.x - 100, self.view.center.y)
        
        rightFrame = UIView(frame: CGRectMake(0, 0, 80, 80))
        rightFrame.layer.borderColor = UIColor.lightGrayColor().CGColor
        rightFrame.layer.borderWidth = 1.0
        rightFrame.center = CGPointMake(self.view.center.x + 100, self.view.center.y)
        
        rect = UIView(frame: CGRectMake(0, 0, 75, 75))
        rect.backgroundColor = UIColor.blueColor()
        rect.center = leftFrame.center
        
        self.view.addSubview(leftFrame)
        self.view.addSubview(rightFrame)
        self.view.addSubview(rect)
    }
    
    
    //----------- ジェスチャーの追加 ------------//
    
    func configureGestures()
    {
        // rect に Swipe Left Gesture追加
        var swipeGestureRecognizerLeft = UISwipeGestureRecognizer(target: self, action: Selector("callSwipeLeftAnimation"))
        swipeGestureRecognizerLeft.direction = .Left
        rect.addGestureRecognizer(swipeGestureRecognizerLeft)
        
        
        // rect に Swipe Right Gesture追加
        var swipeGestureRecognizerRight = UISwipeGestureRecognizer(target: self, action: Selector("callSwipeRightAnimation"))
        swipeGestureRecognizerRight.direction = .Right
        rect.addGestureRecognizer(swipeGestureRecognizerRight)
    }
    
    //----------- アニメーション ------------//
    
    func callSwipeLeftAnimation()
    {
        // 左の枠へ移動するアニメーション
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.rect.center = self.leftFrame.center
        })
    }
    
    func callSwipeRightAnimation()
    {
        // 右の枠へ移動するアニメーション
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.rect.center = self.rightFrame.center
        })
    }
}


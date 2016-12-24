//
//  ViewController.swift
//  CustomActionSheet
//
//  Created by yaoshuai on 2016/12/24.
//  Copyright © 2016年 ys. All rights reserved.
//

import UIKit

class ViewController: UIViewController,LCActionSheetDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 方式一：使用代理方法执行按钮事件
    @IBAction func defaultActionSheetButtonClick(_ sender: UIButton) {
        
        // title可以为nil
        // 取消按钮：Index = 0
        // 其他按钮：按照数组中的顺序 1、2、3……
        let actionSheet = LCActionSheet(title: "this is the title", delegate: self, cancelButtonTitle: "取消", otherButtonTitleArray: ["分享","确认","删除"])
        
        actionSheet?.show()
    }
    
    // 自定义样式
    @IBAction func customActionSheetButtonClick(_ sender: UIButton) {
        
        let actionSheet = LCActionSheet(title: nil, delegate: self, cancelButtonTitle: "取消", otherButtonTitleArray: ["分享","确认","删除"])
        
        actionSheet?.title = "This is a very very very very very very very very very very very very very very very very very very very very very very very very very very very long title"
        actionSheet?.titleFont = UIFont.boldSystemFont(ofSize: 15)
        actionSheet?.titleColor = UIColor.orange
        actionSheet?.titleEdgeInsets = UIEdgeInsetsMake(10, 20, 30, 40);
        
        actionSheet?.buttonColor = UIColor.green
        actionSheet?.buttonFont = UIFont.boldSystemFont(ofSize: 15)
        actionSheet?.buttonHeight = 60.0;
        
        actionSheet?.canScrolling = true;
        actionSheet?.visibleButtonCount = 3.6;
        actionSheet?.darkViewNoTaped = true;
        actionSheet?.unBlur = true;
        actionSheet?.destructiveButtonColor = UIColor.blue
        
        actionSheet?.show()
    }
    
    // 方式三：使用闭包方式执行按钮事件
    @IBAction func blockActionSheetButtonClick(_ sender: UIButton) {
        
        // title可以为nil
        // 取消按钮：Index = 0
        // 其他按钮：按照数组中的顺序 1、2、3……
        let actionSheet = LCActionSheet(title: "this is the title", cancelButtonTitle: "取消", clicked: { (actionSheet, buttonIndex) in
            print("cancelButtonAtIndex:\(buttonIndex)")
        }, otherButtonTitleArray: ["按钮一","按钮二","按钮三","按钮四","按钮五","按钮六"])
        
        actionSheet?.blurEffectStyle = UIBlurEffectStyle.light
        actionSheet?.canScrolling = true
        actionSheet?.visibleButtonCount = 3.6
        
        actionSheet?.willPresentHandle = { (actionSheet) -> () in
            print("willPresentActionSheet")
        }
        actionSheet?.didPresentHandle = { (actionSheet) in
            print("didPresentActionSheet")
        }
        actionSheet?.willDismissHandle = { (actionSheet,buttonIndex:Int) in
            print("willDismissWithButtonIndex:\(buttonIndex)")
        }
        actionSheet?.didDismissHandle = { (actionSheet,buttonIndex:Int) in
            print("didDismissWithButtonIndex:\(buttonIndex)")
        }
        
        actionSheet?.show()
    }
    
    // MARK: - LCActionSheetDelegate
    func actionSheet(_ actionSheet: LCActionSheet!, clickedButtonAt buttonIndex: Int) {
        print("clickedButtonAtIndex: \(buttonIndex)")
    }
    
    func willPresent(_ actionSheet: LCActionSheet!) {
        print("willPresentActionSheet")
    }
    func didPresent(_ actionSheet: LCActionSheet!) {
        print("didPresentActionSheet")
    }
    
    func actionSheet(_ actionSheet: LCActionSheet!, willDismissWithButtonIndex buttonIndex: Int) {
        print("willDismissWithButtonIndex：\(buttonIndex)")
    }
    func actionSheet(_ actionSheet: LCActionSheet!, didDismissWithButtonIndex buttonIndex: Int) {
        print("didDismissWithButtonIndex：\(buttonIndex)")
    }
}


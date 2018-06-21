//
//  XPToalst.swift
//  Test
//
//  Created by XP on 2017/4/21.
//  Copyright © 2017年 XP. All rights reserved.
//

import UIKit


enum ShowWhere {
    case top
    case center
    case bottom
}


class XPToalst: NSObject {
    
    
    var contentView : UIView!
    /// 显示时长默认
    var duration_set : TimeInterval = 3
    /// 透明度
    var alpha_set : CGFloat = 0.8
    /// 宽度比例
    var scale_width : CGFloat = 0.9
    
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    
    
    class func showText(文字 text:String,位置 location:ShowWhere,时长 durtion:TimeInterval?) {
        let xptoalst = XPToalst()
        xptoalst.showMessage(文字: text, 位置: location, 时长: durtion)
    }
    
    
    func showMessage(文字 message:String,位置 location:ShowWhere,时长 durtion:TimeInterval?){
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth * scale_width , height: 30))
        label.numberOfLines = 3
        label.textColor = UIColor.white
        label.text = message
        label.sizeToFit()
        
        contentView = UIView(frame: CGRect(x: 0, y: 0, width: label.bounds.width + 10, height: label.bounds.height + 10))
        
        contentView.backgroundColor = UIColor.black
        contentView.layer.cornerRadius = 5
        
        if durtion != nil && Int(durtion!) > 0 {
            self.duration_set = durtion!
        }
        
        let window = UIApplication.shared.windows.last
        switch location {
            case .top:
                contentView.center = CGPoint(x: screenWidth/2, y: screenHeight * 0.2)
            case .center:
                contentView.center = CGPoint(x: screenWidth/2, y: screenHeight/2)
            case .bottom :
                contentView.center = CGPoint(x: screenWidth/2, y: screenHeight * 0.8)
        }
        label.center = CGPoint(x: contentView.bounds.width/2, y: contentView.bounds.height/2)
        contentView.addSubview(label)
        window?.addSubview(contentView)
        self.perform(#selector(self.dismissShowView), with: nil, afterDelay: self.duration_set)
        
        self.contentView.alpha = 0
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
            self.contentView.alpha = self.alpha_set
        }) { (finish) in
            
        }
    }
    
    func dismissShowView() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
            self.contentView.alpha = 0
        }) { (finish) in
            self.contentView.removeFromSuperview()
        }
    }
    

}

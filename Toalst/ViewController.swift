//
//  ViewController.swift
//  Toalst
//
//  Created by XP on 2017/9/11.
//  Copyright © 2017年 XP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.red
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func clickTop(_ sender: Any) {
        XPToalst.showText(文字: "呵呵哒", 位置: .top, 时长: nil)
    }

    @IBAction func clickCenter(_ sender: Any) {
        XPToalst.showText(文字: "来，面对镜子的时候，突然发现两年前留下的伤疤好了很多。 认识我的人都知道，我是一个很浪的人。", 位置: .center, 时长: nil)
    }
    
    
    @IBAction func clickBottom(_ sender: Any) {
        XPToalst.showText(文字: "呵呵哒", 位置: .bottom, 时长: nil)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


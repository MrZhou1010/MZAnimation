//
//  MZEasyAnimationVC.swift
//  MZAnimation
//
//  Created by 木木 on 2020/11/3.
//  Copyright © 2020 Mr.Z. All rights reserved.
//

import UIKit
import EasyAnimation

class MZEasyAnimationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Lottie动画"
        self.view.backgroundColor = UIColor.white
        self.setupUI()
    }
    
    private func setupUI() {
        let easyView = UIView.init(frame: CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        easyView.backgroundColor = UIColor.orange

    }
}

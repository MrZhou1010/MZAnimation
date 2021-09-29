//
//  MZEasyAnimationVC.swift
//  MZAnimation
//
//  Created by Mr.Z on 2020/11/3.
//  Copyright © 2020 Mr.Z. All rights reserved.
//

import UIKit
import EasyAnimation

class MZEasyAnimationVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "EasyAnimation动画"
        self.view.backgroundColor = UIColor.white
        self.setupUI()
    }
    
    private func setupUI() {
        let easyAnimationView = UIView.init(frame: CGRect(x: 60.0, y: 100.0, width: 80.0, height: 80.0))
        easyAnimationView.backgroundColor = UIColor.orange
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [.repeat, .autoreverse, .curveLinear], animations: {
            easyAnimationView.layer.cornerRadius = 20
            easyAnimationView.layer.position = CGPoint(x: easyAnimationView.layer.position.x + 100.0, y: easyAnimationView.layer.position.y + 100.0)
        }, completion: nil)
        self.view.addSubview(easyAnimationView)
    }
}

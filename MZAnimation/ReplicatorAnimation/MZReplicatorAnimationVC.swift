//
//  MZReplicatorAnimationVC.swift
//  MZAnimation
//
//  Created by Mr.Z on 2021/9/29.
//  Copyright © 2021 Mr.Z. All rights reserved.
//

import UIKit

class MZReplicatorAnimationVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Replicator动画"
        self.view.backgroundColor = UIColor.white
        self.setupUI()
    }
    
    private func setupUI() {
        let scaleLoadingView = MZBallLoadingView.init(frame: CGRect(x: 60.0, y: 200.0, width: 80.0, height: 30.0))
        scaleLoadingView.style = .scale
        scaleLoadingView.ballCount = 3
        scaleLoadingView.ballSize = CGSize(width: 20.0, height: 20.0)
        scaleLoadingView.ballSpace = 10.0
        scaleLoadingView.ballColor = UIColor.orange
        self.view.addSubview(scaleLoadingView)
        scaleLoadingView.startLoadingAnimation()
        
        let opacityLoadingView = MZBallLoadingView.init(frame: CGRect(x: 60.0, y: 300.0, width: 80.0, height: 30.0))
        opacityLoadingView.backgroundColor = UIColor.clear
        opacityLoadingView.style = .opacity
        opacityLoadingView.ballCount = 5
        opacityLoadingView.ballSize = CGSize(width: 14.0, height: 14.0)
        opacityLoadingView.ballSpace = 7.0
        opacityLoadingView.ballColor = UIColor.gray
        self.view.addSubview(opacityLoadingView)
        opacityLoadingView.startLoadingAnimation()
    }
}

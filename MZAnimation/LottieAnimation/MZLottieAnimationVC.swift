//
//  MZLottieAnimationVC.swift
//  MZAnimation
//
//  Created by Mr.Z on 2020/6/29.
//  Copyright © 2020 Mr.Z. All rights reserved.
//

import UIKit
import Lottie

class MZLottieAnimationVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Lottie动画"
        self.view.backgroundColor = UIColor.white
        self.setupUI()
    }
    
    private func setupUI() {
        // 加载本地json动画
        let localAnimationView = AnimationView.init(name: "lottie_loading")
        localAnimationView.frame = CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0)
        localAnimationView.contentMode = .scaleAspectFill
        // 循环动画,默认动画播放一次
        localAnimationView.loopMode = .loop
        // 动画播放速度,默认动画速度为1.0
        localAnimationView.animationSpeed = 2.0
        // 进入后台默认暂停动画,pauseAndRestore表示暂停后重新开始动画
        localAnimationView.backgroundBehavior = .pauseAndRestore
        localAnimationView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.autoreverse], animations: {
            localAnimationView.transform = CGAffineTransform.identity
        }, completion: nil)
        self.view.addSubview(localAnimationView)
        localAnimationView.play()
        
        // 加载网络json动画
        let url = URL(string: "https://assets9.lottiefiles.com/packages/lf20_dH29dn.json")
        let networkAnimationView = AnimationView.init(url: url!, imageProvider: nil, closure: { (error) in
            if error == nil {
                self.setNeedsFocusUpdate()
            }
        })
        networkAnimationView.frame = CGRect(x: 100.0, y: 300.0, width: 100.0, height: 100.0)
        networkAnimationView.contentMode = .scaleAspectFill
        // 循环动画,默认动画播放一次
        networkAnimationView.loopMode = .loop
        // 动画播放速度,默认动画速度为1.0
        networkAnimationView.animationSpeed = 1.0
        // 进入后台默认暂停动画,pauseAndRestore表示暂停后重新开始动画
        networkAnimationView.backgroundBehavior = .pauseAndRestore
        self.view.addSubview(networkAnimationView)
        networkAnimationView.play()
    }
}

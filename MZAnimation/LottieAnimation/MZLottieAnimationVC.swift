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
        // loading动画
        let loadingAnimationView = AnimationView.init(name: "lottie_loading")
        loadingAnimationView.frame = CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0)
        loadingAnimationView.contentMode = .scaleAspectFill
        // 循环动画,默认动画播放一次
        loadingAnimationView.loopMode = .loop
        // 动画播放速度,默认动画速度为1.0
        loadingAnimationView.animationSpeed = 2.0
        // 进入后台默认暂停动画,pauseAndRestore表示暂停后重新开始动画
        loadingAnimationView.backgroundBehavior = .pauseAndRestore
        self.view.addSubview(loadingAnimationView)
        loadingAnimationView.play()
        
        // 加载本地json动画
        let localAnimationView = AnimationView.init(name: "lottie_like")
        localAnimationView.frame = CGRect(x: 100.0, y: 300.0, width: 100.0, height: 100.0)
        localAnimationView.contentMode = .scaleAspectFill
        // 循环动画,默认动画播放一次
        localAnimationView.loopMode = .loop
        // 动画播放速度,默认动画速度为1.0
        localAnimationView.animationSpeed = 2.0
        // 进入后台默认暂停动画,pauseAndRestore表示暂停后重新开始动画
        localAnimationView.backgroundBehavior = .pauseAndRestore
        localAnimationView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
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
        networkAnimationView.frame = CGRect(x: 100.0, y: 500.0, width: 100.0, height: 100.0)
        networkAnimationView.contentMode = .scaleAspectFill
        // 循环动画,默认动画播放一次
        networkAnimationView.loopMode = .playOnce
        // 动画播放速度,默认动画速度为1.0
        networkAnimationView.animationSpeed = 1.0
        // 进入后台默认暂停动画,pauseAndRestore表示暂停后重新开始动画
        networkAnimationView.backgroundBehavior = .pauseAndRestore
        self.view.addSubview(networkAnimationView)
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(playAnimation(tap:)))
        networkAnimationView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func playAnimation(tap: UITapGestureRecognizer) {
        if tap.view is AnimationView {
            (tap.view as! AnimationView).play()
        }
    }
}

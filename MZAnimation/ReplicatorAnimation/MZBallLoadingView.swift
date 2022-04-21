//
//  MZBallLoadingView.swift
//  MZAnimation
//
//  Created by Mr.Z on 2021/9/29.
//  Copyright © 2021 Mr.Z. All rights reserved.
//

import UIKit

public enum MZBallLoadingAnimationStyle: String {
    case opacity = "opacity"
    case scale = "transform.scale"
}

class MZBallLoadingView: UIView {
    
    /// 动画样式
    public var style: MZBallLoadingAnimationStyle = .opacity
    
    /// 球的个数,默认3个
    public var ballCount: Int = 3 {
        didSet {
            self.updateFrame()
        }
    }
    
    /// 球的颜色,默认lightGray
    public var ballColor: UIColor = UIColor.lightGray {
        didSet {
            self.updateFrame()
        }
    }
    
    /// 球的大小,默认(10.0, 10.0)
    public var ballSize: CGSize = CGSize(width: 10.0, height: 10.0) {
        didSet {
            self.updateFrame()
        }
    }
    
    /// 球的间距,默认8.0
    public var ballSpace: CGFloat = 8.0 {
        didSet {
            self.updateFrame()
        }
    }
    
    private let replicatorLayer = CAReplicatorLayer()
    
    private let ballLayer = CALayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.replicatorLayer.instanceTransform = CATransform3DMakeTranslation(self.replicatorLayer.bounds.width / CGFloat(self.ballCount), 0, 0)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViews() {
        let min = min(self.ballSize.width, self.ballSize.height)
        let width = (min + self.ballSpace) * CGFloat(self.ballCount) - self.ballSpace
        self.replicatorLayer.backgroundColor = UIColor.clear.cgColor
        self.replicatorLayer.frame = CGRect(x: 0, y: 0, width: width, height: min)
        self.replicatorLayer.instanceCount = self.ballCount
        self.replicatorLayer.instanceDelay = 1.0 / CGFloat(self.ballCount)
        self.layer.addSublayer(self.replicatorLayer)
        
        self.ballLayer.backgroundColor = self.ballColor.cgColor
        self.ballLayer.frame = CGRect(x: 0, y: 0, width: min, height: min)
        self.ballLayer.cornerRadius = min * 0.5
        self.ballLayer.masksToBounds = true
        self.replicatorLayer.addSublayer(self.ballLayer)
    }
    
    private func updateFrame() {
        let min = min(self.ballSize.width, self.ballSize.height)
        let width = (min + self.ballSpace) * CGFloat(self.ballCount) - self.ballSpace
        self.replicatorLayer.frame = CGRect(x: 0, y: 0, width: width, height: min)
        self.replicatorLayer.instanceCount = self.ballCount
        self.replicatorLayer.instanceDelay = 1.0 / CGFloat(self.ballCount)
        
        self.ballLayer.backgroundColor = self.ballColor.cgColor
        self.ballLayer.frame = CGRect(x: 0, y: 0, width: min, height: min)
        self.ballLayer.cornerRadius = min * 0.5
        self.ballLayer.masksToBounds = true
    }
}

extension MZBallLoadingView {
    
    /// 开始动画
    public func startLoadingAnimation() {
        self.ballLayer.removeAnimation(forKey: "ballAnimation")
        let ballAnimation = self.animation(with: self.style, beginTime: CACurrentMediaTime(), from: 1.0, to: 0.3)
        self.ballLayer.add(ballAnimation, forKey: "ballAnimation")
    }
    
    /// 结束动画
    public func stopLoadingAnimation() {
        self.ballLayer.removeAnimation(forKey: "ballAnimation")
    }
}

extension MZBallLoadingView {
    
    private func animation(with style: MZBallLoadingAnimationStyle = .opacity, beginTime: CFTimeInterval = CACurrentMediaTime(), from: CGFloat = 1.0, to: CGFloat = 0.0) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: style.rawValue)
        animation.beginTime = beginTime
        animation.fromValue = from
        animation.toValue = to
        animation.duration = 1.0
        animation.autoreverses = true
        animation.repeatCount = MAXFLOAT
        return animation
    }
}

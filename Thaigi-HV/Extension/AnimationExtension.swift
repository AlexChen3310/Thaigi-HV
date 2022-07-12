//
//  AnimationExtension.swift
//  IMF88
//
//  Created by Johnny on 2020/6/30.
//  Copyright © 2020 IMF88. All rights reserved.
//

import UIKit

extension CABasicAnimation {
    func opacityAnimation(_ time: Float) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1.0
        animation.toValue = 0.0
        animation.autoreverses = true
        animation.duration = CFTimeInterval(time)
        animation.repeatCount = MAXFLOAT
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        return animation
    }
}

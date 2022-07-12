//
//  NSLayoutConstraintExtension.swift
//  TFChessApp
//
//  Created by Johnny on 2021/4/27.
//

import Foundation
import UIKit.NSLayoutConstraint

extension NSLayoutConstraint{
    func updateMultiplier(multiplier: CGFloat) -> NSLayoutConstraint{
        NSLayoutConstraint.deactivate([self])
        let newConstraint = NSLayoutConstraint(item: self.firstItem,
                                               attribute: self.firstAttribute,
                                               relatedBy: self.relation,
                                               toItem: self.secondItem,
                                               attribute: self.secondAttribute,
                                               multiplier: multiplier,
                                               constant: self.constant)
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        newConstraint.isActive = true
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}

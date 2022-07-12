//
//  UIViewExtension.swift
//  IMF88
//
//  Created by Johnny on 2020/5/26.
//  Copyright © 2020 IMF88. All rights reserved.
//

import Foundation
import UIKit


public let ScreenWidth = UIScreen.main.bounds.size.width;
public let ScreenHeight = UIScreen.main.bounds.size.height;

/// 螢幕比例
public let scaleWidth = ScreenWidth / 667;
public let scaleHeight = ScreenHeight / 375;


public enum ZHYShakeDirection: Int {
    case horizontal
    case vertical
}

extension UIView{
    
    public class func instantiateFromNib<T: UIView>(viewType: T.Type) -> T {
        return Bundle.main.loadNibNamed(String(describing: viewType), owner: nil, options: nil)?.first as! T
    }
    
    public class func instantiateFromNib() -> Self {
        return instantiateFromNib(viewType: self)
    }
    
    static func makeObject() -> Self {
           Bundle.main.loadNibNamed("\(Self.self)", owner: nil, options: nil)?.first as! Self
       }
    class func loadNib() -> UINib {
        let name = String(describing: self)
        return UINib(nibName: name, bundle: Bundle.main)
    }
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    /// attaches all sides of the receiver to its parent view
    
    func layoutAttachAll(margin: UIEdgeInsets = .zero) {
        let view = superview
        layoutAttachTop(to: view, margin: margin.top);
        layoutAttachLeading(to: view, margin: margin.left);
        layoutAttachBottom(to: view, margin: margin.bottom);
        layoutAttachTrailing(to: view, margin: margin.right);
    }
    
    /// attaches the top of the current view to the given view's top if it's a superview of the current view, or to it's bottom if it's not (assuming this is then a sibling view).
    /// if view is not provided, the current view's super view is used
    @discardableResult
    func layoutAttachTop(to: UIView? = nil, margin: CGFloat = 0.0) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let view: UIView? = to ?? superview
        let isSuperview = view == superview
        let constraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: isSuperview ? .top : .bottom, multiplier: 1.0, constant: margin)
        superview?.addConstraint(constraint)
        
        return constraint
    }
    
    /// attaches the leading edge of the current view to the given view
    @discardableResult
    func layoutAttachLeading(to: UIView? = nil, margin: CGFloat = 0.0) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let view: UIView? = to ?? superview
        let isSuperview = (view == superview) || false
        let constraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: isSuperview ? .leading : .trailing, multiplier: 1.0, constant: margin)
        superview?.addConstraint(constraint)
        
        return constraint
    }
    
    /// attaches the bottom of the current view to the given view
    @discardableResult
    func layoutAttachBottom(to: UIView? = nil, margin: CGFloat = 0.0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let view: UIView? = to ?? superview
        let isSuperview = (view == superview) || false
        let constraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: isSuperview ? .bottom : .top, multiplier: 1.0, constant: -margin)
        if let priority = priority {
            constraint.priority = priority
        }
        superview?.addConstraint(constraint)
        
        return constraint
    }
    
    /// attaches the trailing edge of the current view to the given view
    @discardableResult
    func layoutAttachTrailing(to: UIView? = nil, margin: CGFloat = 0.0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let view: UIView? = to ?? superview
        let isSuperview = (view == superview) || false
        let constraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: isSuperview ? .trailing : .leading, multiplier: 1.0, constant: -margin)
        if let priority = priority {
            constraint.priority = priority
        }
        superview?.addConstraint(constraint)
        
        return constraint
    }
    func setWidth(_ width:CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        let widthConstraint = NSLayoutConstraint.init(item: self, attribute: NSLayoutConstraint.Attribute.width, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: width)
        self.addConstraint(widthConstraint);
    }
    func setHeight(_ height:CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = NSLayoutConstraint.init(item: self, attribute: NSLayoutConstraint.Attribute.height, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: height)
        self.addConstraint(heightConstraint);
    }
    func addDottedLine(bounds: CGRect,lineColor: UIColor, lineWidth: CGFloat = 1) {
        let dottedLineBorder = CAShapeLayer()
        dottedLineBorder.strokeColor = lineColor.cgColor
        dottedLineBorder.lineDashPattern = [4]
        dottedLineBorder.frame = bounds
        dottedLineBorder.fillColor = nil
        dottedLineBorder.lineWidth = lineWidth
        dottedLineBorder.path = UIBezierPath(roundedRect: bounds, cornerRadius: 10).cgPath
        self.layer.addSublayer(dottedLineBorder)
    }
    
    public func shake(direction: ZHYShakeDirection = .horizontal, times: Int = 5, interval: TimeInterval = 0.1, offset: CGFloat = 2, completion: (() -> Void)? = nil) {
        
        //移动视图动画（一次）
        UIView.animate(withDuration: interval, animations: {
            switch direction {
                case .horizontal:
                    self.layer.setAffineTransform(CGAffineTransform(translationX: offset, y: 0))
                case .vertical:
                    self.layer.setAffineTransform(CGAffineTransform(translationX: 0, y: offset))
            }
            
        }) { (complete) in
            //如果当前是最后一次抖动，则将位置还原，并调用完成回调函数
            if (times == 0) {
                UIView.animate(withDuration: interval, animations: {
                    self.layer.setAffineTransform(CGAffineTransform.identity)
                }, completion: { (complete) in
                    completion?()
                })
            }
            
            //如果当前不是最后一次，则继续动画，偏移位置相反
            else {
                self.shake(direction: direction, times: times - 1, interval: interval, offset: -offset, completion: completion)
            }
        }
    }
    public func autoLayoutable() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    public func centerSuperView(
        target:AnchorProvider? = nil,
        offset: CGPoint = CGPoint(x: 0, y: 0)
    ) {
        assert(superview != nil)
        
        guard let superview = target ?? superview else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: offset.x).isActive = true
        self.centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: offset.y).isActive = true
        
    }
    public func fillSuperView(target:AnchorProvider? = nil, inset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        assert(superview != nil)
        
        guard let superview = target ?? superview else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: inset.top).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -inset.bottom).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: inset.left).isActive = true
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: -inset.right).isActive = true
    }
    
    func applyGradient(gradientMaker:UIColor.GradientMaker) {
        
        for subLayer in self.layer.sublayers ?? [] {
            
            if subLayer is CAGradientLayer {
                subLayer.removeFromSuperlayer()
                break;
            }
        }
        let gradient = gradientMaker.makeLayer()
        clipsToBounds = true
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
    }
    var screenShot: UIImage?{
        let layer = self.layer
        let renderer = UIGraphicsImageRenderer(size: layer.frame.size)
        let image = renderer.image(actions: { context in
            layer.render(in: context.cgContext)
        })
        return image
    }
}


public protocol AnchorProvider {
    var centerXAnchor:NSLayoutXAxisAnchor{get}
    var centerYAnchor:NSLayoutYAxisAnchor{get}
    var topAnchor:NSLayoutYAxisAnchor {get}
    var bottomAnchor:NSLayoutYAxisAnchor {get}
    var trailingAnchor:NSLayoutXAxisAnchor {get}
    var leadingAnchor:NSLayoutXAxisAnchor {get}
}

extension UIView: AnchorProvider {}
extension UILayoutGuide: AnchorProvider {}
// MARK: - Animaion
extension UIView {
    /// https://stackoverflow.com/a/54757469/10172299
    func setIsHidden(_ hidden: Bool, animated: Bool) {
        if animated {
            if self.isHidden && !hidden {
                self.alpha = 0.0
                self.isHidden = false
            }
            UIView.animate(withDuration: 0.25, animations: {
                self.alpha = hidden ? 0.0 : 1.0
            }) { (complete) in
                self.isHidden = hidden
            }
        } else {
            self.isHidden = hidden
        }
    }
}

//
//  UIViewControllerExtension.swift
//  imf88
//
//  Created by Johnny on 2020/9/14.
//  Copyright © 2020 Goldenf. All rights reserved.
//

import UIKit
extension UIViewController {
    static func setContainView<R>(
        target: R,
        _ vc:UIViewController,
        in viewPath: KeyPath<R,UIView>)
        where R: UIViewController {
            target.addChild(vc)
            vc.didMove(toParent: target)
            target[keyPath: viewPath].addSubview(vc.view)
            vc.view.fillSuperView()
    }
    var screenShot: UIImage?{
        guard let layer = UIApplication.shared.keyWindow?.layer else { return nil }
        let renderer = UIGraphicsImageRenderer(size: layer.frame.size)
        let image = renderer.image(actions: { context in
            layer.render(in: context.cgContext)
        })
        return image
    }
}


 extension UIViewController {
    static func setupNavigationBar(_ object:UIViewController){
        
        object.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        object.navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        object.navigationController?.navigationBar.clipsToBounds = true
        ///藏起navigationBar下面1 px的線
        object.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        setNavigationBarBackground(object, color: UIColor(hexString: "0x1A212A"))
        
        let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)]
        UINavigationBar.appearance().titleTextAttributes = attributes
    }
    
    static func setNavigationBarBackground(_ object: UIViewController, color:UIColor?){
        
        object.navigationController?.navigationBar.barTintColor = color
        object.navigationController?.navigationBar.backgroundColor = color
        object.navigationController?.navigationBar.tintColor = color
        
    }
    func first<U>(_ transform:(UIViewController) -> U?) -> U? {
        if let u = transform(self) {return u}
        for child in children {
            if let u = child.first(transform) {return u}
        }
        return nil
    }
}

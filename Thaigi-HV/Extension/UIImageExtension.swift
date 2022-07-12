//
//  UIImageExtension.swift
//  IMF88
//
//  Created by Johnny on 2020/5/27.
//  Copyright © 2020 IMF88. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    class func getImageFromBase64String(_ base64String: String) -> UIImage?{
        if let url = URL(string: base64String) {
            if let data = try? Data(contentsOf: url) {
                return UIImage(data: data)
            }
        }
        return nil
    }
    convenience init?(startColor:UIColor, endColor:UIColor, size:CGSize, horizontally:Bool = true) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        if horizontally {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        } else {
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        }

        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage);
    }
    
    func changeImageToColor(_ color:UIColor, alpha:CGFloat = 1.0) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0)
        color.setFill();
        let bounds = CGRect(origin: .zero, size: self.size);
        UIRectFill(bounds);
        
        self.draw(in: bounds, blendMode: .destinationIn, alpha: alpha);
        guard let tintedImage = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage.init() };
        UIGraphicsEndImageContext();
        return tintedImage;
    }
    class func imageWithView(view: UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0);
        view.layer.render(in: UIGraphicsGetCurrentContext()!)

        guard let img = UIGraphicsGetImageFromCurrentImageContext() else{
            return UIImage()
        }
        UIGraphicsEndImageContext()
        return img
    }
}

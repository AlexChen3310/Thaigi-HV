//
//  NSAttritubedStringExtension.swift
//  imf88
//
//  Created by Johnny on 2020/8/17.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

extension NSAttributedString {
    
    static func createBulletedList(
        string: String,
        bulletPoint: String = "\u{2022}",
        font: UIFont? = nil,
        inject _paragraghStyle: NSParagraphStyle? = nil
        ) -> NSAttributedString {
        
        let fullAttributedString = NSMutableAttributedString()
        let attributesDictionary: [NSAttributedString.Key: Any]
        
        if font != nil {
            attributesDictionary = [NSAttributedString.Key.font: font!]
        } else {
            attributesDictionary = [NSAttributedString.Key: Any]()
        }
        
        let formattedString: String = [
            bulletPoint,
            string
            ].joined(separator: " ")
        
        
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: formattedString, attributes: attributesDictionary)
        let paragraphStyle = createParagraphAttribute(from: _paragraghStyle)
        paragraphStyle.headIndent = (bulletPoint as NSString).size(withAttributes: attributesDictionary).width
        attributedString.addAttributes([NSAttributedString.Key.paragraphStyle: paragraphStyle], range: NSMakeRange(0, attributedString.length))
        fullAttributedString.append(attributedString)
        
        
        return fullAttributedString
    }
    
    private static func createParagraphAttribute(
        from style: NSParagraphStyle?) -> NSMutableParagraphStyle {
        let paragraphStyle: NSMutableParagraphStyle = (style ?? .default).mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.tabStops = [NSTextTab(textAlignment: .left, location: 15, options: NSDictionary() as! [NSTextTab.OptionKey : Any])]
        paragraphStyle.defaultTabInterval = 15
        paragraphStyle.firstLineHeadIndent = 0
        paragraphStyle.headIndent = 11
        return paragraphStyle
    }
}
extension NSMutableParagraphStyle {
    func setIndent(bulletPoint:NSAttributedString) {
        tabStops = [NSTextTab(textAlignment: .left, location: 15)]
        defaultTabInterval = 15
        firstLineHeadIndent = 0
        headIndent = bulletPoint.size().width
    }
}

extension Sequence where Iterator.Element == NSAttributedString {
    func joined(with separator: NSAttributedString) -> NSAttributedString {
        return self.reduce(NSMutableAttributedString()) {
            (r, e) in
            if r.length > 0 {
                r.append(separator)
            }
            r.append(e)
            return r
        }
    }

    func joined(with separator: String = "") -> NSAttributedString {
        return self.joined(with: NSAttributedString(string: separator))
    }
}

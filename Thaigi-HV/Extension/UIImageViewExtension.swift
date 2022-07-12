//
//  UIImageViewExtension.swift
//  TFChessApp
//
//  Created by ye hengjia on 2021/4/17.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadFromUrl(url: URL) {
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
    func loadFromUrlString(urlString: String) {
        
        if let url = URL.init(string: urlString) {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        }
    }
}

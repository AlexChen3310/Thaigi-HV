//
//  HorizontalCellable.swift
//  TFChessApp
//
//  Created by Johnny on 2021/12/15.
//

import Foundation
import UIKit

protocol HorizontalCellable {
    static var reuseId: String { get }
    static var nib: UINib { get }
    static var itemSize: CGSize { get }
    /// 一排要幾個cell
    static var itemPerRow: CGFloat? { get }
}

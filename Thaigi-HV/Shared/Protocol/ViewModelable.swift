//
//  ViewModelable.swift
//  TFChessApp
//
//  Created by Johnny on 2020/11/24.
//

import Foundation
import UIKit

protocol ViewModelable {
    func bind()
    var updateLoadingStatus: ((Bool) -> Void)? { get set }
    var updateView: (() -> Void)? { get set }
}

protocol TableViewModelable: ViewModelable {
    associatedtype T
    var feeds:[T] { get set }
    var reloadTableView: (() -> Void)? { get set }
    
    /// 是否需要顯示Loading View
    var updateLoadingStatus: ((Bool) -> Void)? { get set }
}
protocol CollectionViewModelable: ViewModelable {
    associatedtype T
    var feeds:[T] { get set }
    var reloadCollectionView:(() -> Void)? { get set }
    /// 是否需要顯示Loading View
    var updateLoadingStatus: ((Bool) -> Void)? { get set }
}
protocol ViewConfigurable {
    associatedtype T
    func configure(viewModel: T)
}

protocol InputTextViewable {
    
    var keyboardType: UIKeyboardType { get set }
    var title: String { get set }
    var titleColor: UIColor{ get }
    var content:String{ get set }
    var contentColor: UIColor{ get }
    var placeHolder: String{ get }
    var placeHolderColor: UIColor{ get }
    var hint: String { get set }
    var hintColor: UIColor { get }
    var showHint: Bool{ get set }
    var canEditing: Bool{ get set }
    var iconImage: UIImage? { get set }
    var isSecureTextEntry: Bool { get }
    var unFocusColor: UIColor { get }
}

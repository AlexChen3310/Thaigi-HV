//
//  ViewControllerable.swift
//  TFChessApp
//
//  Created by Johnny on 2020/11/24.
//

import Foundation

protocol ViewControllerable {
    func setup()
    func setupView()
    func setupViewModel()
}

protocol TableViewControllerable: ViewControllerable {
    func regiestCell()
}

protocol CollectionViewControllerable: ViewControllerable {
    func regiestCell()
}

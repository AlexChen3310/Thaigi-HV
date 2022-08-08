//
//  SettingViewModel.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/8/3.
//

import Foundation

class SettingViewModel: TableViewModelable {
    var feeds: [RowType] = []
    
    var reloadTableView: (() -> Void)?

    enum RowType {
        case language(viewModel: SettingCellViewModel)
        case music(viewModel: SettingCellViewModel)
        case sound(viewModel: SettingCellViewModel)
        case quick(viewModel: SettingCellViewModel)
    }
    
    typealias T = RowType
    
    func bind() {
        featch_feeds()
    }
    
    var updateLoadingStatus: ((Bool) -> Void)?
    
    var updateView: (() -> Void)?
}

fileprivate extension SettingViewModel {
    func featch_feeds() {
        self.feeds.append(.language(viewModel: SettingCellViewModel(imageName: "setting_language", title: HVSetting.Title.language)))
        self.feeds.append(.music(viewModel: SettingCellViewModel(imageName: "setting_music", title: HVSetting.Title.music)))
        self.feeds.append(.sound(viewModel: SettingCellViewModel(imageName: "setting_sound", title: HVSetting.Title.sound)))
        self.feeds.append(.quick(viewModel: SettingCellViewModel(imageName: "setting_login", title: HVSetting.Title.quick)))
    }
}

//
//  LaunchViewModel.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/7/28.
//

import Foundation

class LaunchViewModel: ViewModelable {
    var updateLoadingStatus: ((Bool) -> Void)?
    
    var updateView: (() -> Void)?
    
    func bind() {
        fetch_wtoken()
    }
}

extension LaunchViewModel {
    func fetch_wtoken() {
        let target = LaunchService.GetWToken()
        let provider = AppMoyaProvider(target: target)
        
        provider.request { result in
            switch result {
            case .success(let response):
                Arguments.wtoken = response.wtoken
            case .failure(let error):
                print(error)
            }
            self.updateView?()
        }
    }
}

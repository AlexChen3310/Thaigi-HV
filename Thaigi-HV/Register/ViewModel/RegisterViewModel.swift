//
//  RegisterViewModel.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/7/29.
//

import Foundation
import UIKit

class RegisterViewModel: TableViewModelable {
    var reloadTableView: (() -> Void)?
    
    enum RowType {
        case account(viewModel: RegisterCellViewModel)
        case password(viewModel: RegisterCellViewModel)
        case again(viewModel: RegisterCellViewModel)
        case verify(viewModel: RegisterCellViewModel)
    }
    
    var feeds: [RowType] = []
    
    typealias T = RowType
    
    internal init(_ verifyViewModel: VerifyViewModel) {
        self.verify = verifyViewModel
    }
    let verify: VerifyViewModel
    
    func bind() {
        featch_feeds()
    }
    
    var updateLoadingStatus: ((Bool) -> Void)?
    var updateButtonStatus: ((Bool) -> Void)?
    
    var updateView: (() -> Void)?
    
    var request = RegisterRequest.Register(account: "", password: "", password_confirmation: "", verify: "")
}


extension RegisterViewModel {
    fileprivate func featch_feeds() {
        self.feeds.append(.account(viewModel: RegisterCellViewModel(imageName: "register_account", placeholder: HVRegister.Placeholder.account, errorMessage: HVRegister.Error.account)))
        self.feeds.append(.password(viewModel: RegisterCellViewModel(imageName: "register_password", placeholder: HVRegister.Placeholder.password, errorMessage: HVRegister.Error.password)))
        self.feeds.append(.again(viewModel: RegisterCellViewModel(imageName: "register_password", placeholder: HVRegister.Placeholder.again, errorMessage: HVRegister.Error.confirm)))
        
        let verifyModel = RegisterCellViewModel(imageName: "register_password", placeholder: HVRegister.Placeholder.verify, errorMessage: HVRegister.Error.verify)
        verifyModel.verify = verify.image
        
        self.feeds.append(.verify(viewModel: verifyModel))
    }
}

extension RegisterViewModel {
    func upButtonStatus() {
        var isSend: Bool = false
        if request.account.checkAccount() &&
            request.password.checkPassword() &&
            request.password == request.password_confirmation &&
            request.verify == verify.text {
            isSend = true
        }
        self.updateButtonStatus?(isSend)
    }
    
    func checkPasswordAgain(_ text: String) -> Bool {
        return request.password == text
        
    }
    
    func checkVerify(_ text: String) -> Bool {
        return verify.text == text
    }
    
    func register() {
        updateLoadingStatus?(true)
        let target = RegisterService.Register(request: request)
        let provider = AppMoyaProvider(target: target)
        
        provider.request { result in
            self.updateLoadingStatus?(false)
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
            self.updateView?()
        }
    }
}

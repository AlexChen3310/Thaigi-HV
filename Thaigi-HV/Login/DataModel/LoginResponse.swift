//
//  LoginResponse.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/7/29.
//

import Foundation

struct LoginResponse: Codable {
    let status: String
    let data: DataClass
}


struct DataClass: Codable {
    let accessToken: String
    let tokenType: String
    let expiresIn: String
    var member: LoginMember
    let recommendCode: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case member = "member"
        case recommendCode = "recommend_code"
    }
}

struct LoginMember: Codable {
    let account: String
    let viplevel: String
    let paymentGroup: String
    var walletType: String
    let status: String
    let vip: [Vip]
//    let vipProgress: [VipProgress]
    let wallets: Wallets
    
    enum CodingKeys: String, CodingKey {
        case account = "account"
        case viplevel = "viplevel"
        case paymentGroup = "payment_group"
        case walletType = "wallet_type"
        case status = "status"
        case vip = "vip"
//        case vipProgress = "vip_progress"
        case wallets = "wallets"
    }
}

struct Vip: Codable {
    let id: String
    let code: String
    let name: String
    let updatedAt: String
    let createdAt: String
    let betAmount: Int
    let birthBonus: Int
    let depositAmount: Int
    let extraBonus: String
    let minBetAmount: Int
    let monthlyBonus: Int
    let rebateFrequency: String
    let rebateMax: Int
    let rebateMultiple: Int
    let upgradeBonus: Int
    let withdrawalDailyAmount: Int
    let withdrawalDailyCount: Int
    let withdrawalMaxAmount: Int
    let withdrawalMinAmount: Int
    let rebateBonusPercent: Int
    let rebateMinTransfer: Int
    let paymentGroup: String
    let egameRebate: String?
    let logo: String
    let icon: String
    let card: String
    let rebates: [Rebate]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case code = "code"
        case name = "name"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case betAmount = "bet_amount"
        case birthBonus = "birth_bonus"
        case depositAmount = "deposit_amount"
        case extraBonus = "extra_bonus"
        case minBetAmount = "min_bet_amount"
        case monthlyBonus = "monthly_bonus"
        case rebateFrequency = "rebate_frequency"
        case rebateMax = "rebate_max"
        case rebateMultiple = "rebate_multiple"
        case upgradeBonus = "upgrade_bonus"
        case withdrawalDailyAmount = "withdrawal_daily_amount"
        case withdrawalDailyCount = "withdrawal_daily_count"
        case withdrawalMaxAmount = "withdrawal_max_amount"
        case withdrawalMinAmount = "withdrawal_min_amount"
        case rebateBonusPercent = "rebate_bonus_percent"
        case rebateMinTransfer = "rebate_min_transfer"
        case paymentGroup = "payment_group"
        case egameRebate = "egame_rebate"
        case logo = "logo"
        case icon = "icon"
        case card = "card"
        case rebates = "rebates"
    }
}

struct Rebate: Codable {
    let name: String
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
    }
}

// MARK: - Wallets
struct Wallets: Codable {
    let account: String
    let walletCode: String
    let balance: String
    
    enum CodingKeys: String, CodingKey {
        case account = "account"
        case walletCode = "wallet_code"
        case balance = "balance"
    }
}

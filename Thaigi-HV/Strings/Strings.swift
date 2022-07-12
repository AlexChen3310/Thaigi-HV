//
//  Strings.swift
//  imf88
//
//  Created by 游宗谕 on 2020/8/10.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

enum Auth {
    
    enum Placeholder {
        static let account = "auth_placeholer_account".localizable
        static let password1 = "auth_placeholer_password1".localizable
        static let password2 = "auth_placeholer_password2".localizable
        static let recommend = "auth_placeholer_recommend".localizable
        static let verify = "auth_placeholer_verify".localizable
    }
    enum Warning {
        static let account = "auth_warning_account".localizable
        static let password = "auth_warning_password".localizable
        static let passwordConfirm = "auth_warning_passwordConfirm".localizable
        static let verify = "auth_warning_verify".localizable
    }
    enum FailureReason {
        static let loginAPIFailure = "auth_FailureReason".localizable
    }
    enum Button {
        static let forgetPassword = "auth_button_forgetPassword".localizable
        static let noAccountlabel = "auth_button_noAccountlabel".localizable
        static let hadAccountLabel = "auth_button_hadAccountLabel".localizable
        static let toRegister = "auth_button_toRegister".localizable
        static let login = "auth_button_login".localizable
        static let biometricLogin = "auth_button_biometricLogin".localizable
        static let register = "auth_button_register".localizable
        static let goMainBeforeLogin = "auth_button_goMainBeforeLogin".localizable
        static let above18 = "auth_button_above18".localizable
        static let regulation = "auth_button_regulation".localizable
        static let rememberPassword = "auth_button_rememberPassword".localizable
    }
    enum Register {
        static let registerSuccess = "auth_register_registerSuccess".localizable
        static let verifySupport = "auth_register_verifySupport".localizable
    }
    enum Regulation {
        static let title = "auth_regulation_title".localizable
        static let p1 = "auth_regulation_p1".localizable.replacingOccurrences(of: "app", with: Bundle.main.appName)
        static let p2 = "auth_regulation_p2".localizable.replacingOccurrences(of: "app", with: Bundle.main.appName)
        static let p3 = "auth_regulation_p3".localizable.replacingOccurrences(of: "app", with: Bundle.main.appName)
    }
    enum Bio {
        /// 必须与 info.plist Privacy - Face ID Usage Description 一致
        static let enableText = "auth_bio_enableText".localizable //"开启生物辨识快速登录功能"
        static let h1 = "auth_bio_h1".localizable
        static let h2 = "auth_bio_h2".localizable
        static let manualLogin = "auth_bio_manualLogin".localizable
    }
    enum ForgetPassword {
        static let title = "auth_forget_password_title".localizable
    }
}

enum MemberCenter{
    enum Label {
        static let centerWallet = "memberCenter_label_center_wallet".localizable
        static let myAvatar = "memberCenter_label_my_avatar".localizable
        static let avatarPreview = "memberCenter_label_avatar_preview".localizable
        static let faq = "memberCenter_label_faq".localizable
        static let help = "memberCenter_label_help".localizable
        static let business = "memberCenter_label_business".localizable
        static let contact = "memberCenter_label_contact".localizable
        static let currentVipLevel = "memberCenter_label_currentVipLevel".localizable
        static let nextVipLevel = "memberCenter_label_nextVipLevel".localizable
    }
    enum Button {
        static let loginFirst = "memberCenter_button_login_first".localizable
        static let deposit = "memberCenter_button_deposit".localizable
        static let withdrawal = "memberCenter_button_withdrawal".localizable
        static let transfer = "memberCenter_button_transfer".localizable
        static let card = "memberCenter_button_card".localizable
    }
    enum MenuTitle{
        static let transationRecord = "memberCenter_menu_title_transation_record".localizable
        static let betRecord = "memberCenter_menu_title_bet_record".localizable
        static let vipOnly = "memberCenter_menu_title_vip_only".localizable
        static let profile = "memberCenter_menu_title_profile".localizable
        static let redeem = "memberCenter_menu_title_redeem".localizable
        static let news = "memberCenter_menu_title_news".localizable
        static let help = "memberCenter_menu_title_help".localizable
        static let qa = "memberCenter_menu_title_qa".localizable
        static let bonus = "memberCenter_menu_title_bonus".localizable
        static let stuff = "memberCenter_menu_title_stuff".localizable
        static let joinUs = "memberCenter_menu_title_joinUs".localizable
        static let deviceSetting = "memberCenter_menu_title_deviceSetting".localizable
        static let logout = "memberCenter_menu_title_logout".localizable
    }
    enum Setting {
        enum Hint {
            static let bioDisableInDevice = "memberCenter_setting_hint_bio_disable_in_device".localizable
        }
    }
    enum Logout {
        static let hint:String = "memberCenter_logout_hint".localizable
    }
}
enum MemberProfile{
    enum Label {
        static let name = "memberProfile_label_name".localizable
        static let gender = "memberProfile_label_gender".localizable
        static let birthday = "memberProfile_label_birthday".localizable
        static let phoneNumber = "memberProfile_label_phoneNumber".localizable
        static let verifyCode = "memberProfile_label_verifyCode".localizable
        static let mail = "memberProfile_label_mail".localizable
        static let withdrawalPasswordTitle = "memberProfile_label_withdrawalPasswordTitle".localizable
        static let withdrawalPassword = "memberProfile_label_withdrawalPassword".localizable
        static let totalDeposit = "memberProfile_label_totalDeposit".localizable
        static let totalWithdrawal = "memberProfile_label_totalWithdrawal".localizable
        static let totalBet = "memberProfile_label_totalBet".localizable
        static let totalEarn = "memberProfile_label_totalEarn".localizable
        static let chooseGender = "memberProfile_label_chooseGender".localizable
        static let confirmWithdrawalPassword = "memberProfile_label_confirmWithdrawalPassword".localizable
        static let withdrawalPasswordSetting = "memberProfile_label_withdrawalPasswordSetting".localizable
        static let getSMSCodeSuccess = "memberProfile_label_getSMSCodeSuccess".localizable
        static let updateProfileSuccess = "memberProfile_label_updateProfileSuccess".localizable
        static let getSMSCodeFail = "memberProfile_label_getSMSCodeFail".localizable
        static let updateProfileFail = "memberProfile_label_updateProfileFail".localizable
        static let smsCodeValidateFail = "memberPrifile_label_verifyCodeFail".localizable
    }
    enum Button {
        static let verifyCode = "memberProfile_button_verifyCode".localizable
        static let withdrawalPassword = "memberProfile_button_withdrawalPassword".localizable
        static let withdrawalPasswordSet = "memberProfile_button_withdrawalPasswordSet".localizable
        static let save = "memberProfile_button_save".localizable
        static let profile = "memberProfile_button_profile".localizable
        static let funds = "memberProfile_button_funds".localizable
    }
    enum Hint {
        static let name = "memberProfile_hint_name".localizable
        static let gender = "memberProfile_hint_gender".localizable
        static let birthday = "memberProfile_hint_birthday".localizable
        static let phoneNumber = "memberProfile_hint_phoneNumber".localizable
        static let verifyCode = "memberProfile_hint_verifyCode".localizable
        static let mail = "memberProfile_hint_mail".localizable
        static let withdrawalPassword = "memberProfile_hint_withdrawalPassword".localizable
        static let profileComplete =  "memberProfile_hint_profileComplete".localizable
        static let countDownFirst = "memberProfile_hint_countDown_first".localizable
        static let countDownSecond = "memberProfile_hint_countDown_second".localizable
        static let profileChange = "memberProfile_hint_profileChange".localizable
    }
    enum Placeholder {
        static let name = "memberProfile_placeHolder_name".localizable
        static let gender = "memberProfile_placeHolder_gender".localizable
        static let birthday = "memberProfile_placeHolder_birthday".localizable
        static let phoneNumber = "memberProfile_placeHolder_phoneNumber".localizable
        static let verifyCode = "memberProfile_placeHolder_verifyCode".localizable
        static let mail = "memberProfile_placeHolder_mail".localizable
        static let withdrawalPassword = "memberProfile_placeHolder_withdrawalPassword".localizable
        static let confirmWithdrawalPassword = "memberProfile_placeHolder_confirmWithdrawalPassword".localizable
    }
    enum Gender {
        static let male = "memberProfile_gender_male".localizable
        static let female = "memberProfile_gender_female".localizable
    }
}

enum Tabbar {
    static let bonus = "tabbar_bonus".localizable
    static let service = "tabbar_service".localizable
    static let recode = "tabbar_recode".localizable
    static let memberCenter = "tabbar_memberCenter".localizable
}
enum BetHistory {
    
    static let title = "bet_history_title".localizable
    static let placeholder = "bet_history_placeholder".localizable
    static let noBetInBetHistory = "bet_history_noBetInBetHistory".localizable
    
    enum Filter {
        static let title = "bet_history_filter_title".localizable
        static var all = "bet_history_filter_all".localizable
        static let cq9 = "bet_history_filter_cq9".localizable
        static let gioco = "bet_history_filter_gioco".localizable
        static let MG = "bet_history_filter_MG".localizable
        static let PG = "bet_history_filter_PG".localizable
        static let CQ = "bet_history_filter_CQ".localizable
    }
    enum BetHint {
        static let number = "bet_history_bet_hint_number".localizable
        static let amount = "bet_history_bet_hint_amount".localizable
        static let give = "bet_history_bet_hint_give".localizable
        static let amount_ = "bet_history_bet_hint_amount_".localizable
        static let toBet = "bet_history_bet_hint_toBet".localizable
        static let betSettled = "bet_history_bet_hint_betSettled".localizable
        static let betUnsettled =  "bet_history_bet_hint_betUnsettled".localizable
        static let betCancel = "bet_history_bet_hint_betCancel".localizable
        static let betCopy = "bet_history_bet_hint_copy".localizable
    }
}
enum NormalizedText {
    static let confirm = "normalized_text_confirm".localizable
    static let cancel = "normalized_text_cancel".localizable
    static let all = "normalized_text_all".localizable
    static let tryAgain = "normalized_text_tryAgain".localizable
    static let activate = "normalized_text_activate".localizable
    static let copid = "normalized_text_copid".localizable
    static let sucess = "normalized_text_sucess".localizable
    static let copy = "normalized_text_copy".localizable
    static let saveSuccess = MemberProfile.Label.updateProfileSuccess
    static let saveFail = MemberProfile.Label.updateProfileFail
}
enum APIDefaultErrorMessage {
    static let unknownError = "APIDefaultErrorMessage_unknownError".localizable
}


enum DatePickerTitle {
    
    static let dateQuickOptionText_Today = "date_picker_title_dateQuickOptionText_Today".localizable
    static let dateQuickOptionText_Yesterday = "date_picker_title_dateQuickOptionText_Yesterday".localizable
    static let dateQuickOptionText_last7Days = "date_picker_title_dateQuickOptionText_last7Days".localizable
    static let dateQuickOptionText_last30Days = "date_picker_title_dateQuickOptionText_last30Days".localizable
    static let dateQuickOptionText_Custom = "date_picker_title_dateQuickOptionText_Custom".localizable
    
    static let monthText:[String] =
        [   "👻",
            "date_picker_title_jan".localizable,
            "date_picker_title_feb".localizable,
            "date_picker_title_mar".localizable,
            "date_picker_title_apr".localizable,
            "date_picker_title_may".localizable,
            "date_picker_title_jun".localizable,
            "date_picker_title_jul".localizable,
            "date_picker_title_aug".localizable,
            "date_picker_title_sep".localizable,
            "date_picker_title_oct".localizable,
            "date_picker_title_nov".localizable,
            "date_picker_title_dec".localizable
        ]
    
    static let dayOfWeekTexts:[String] = [
        "date_picker_title_sunday".localizable,
        "date_picker_title_monday".localizable,
        "date_picker_title_tuesday".localizable,
        "date_picker_title_wednesday".localizable,
        "date_picker_title_thursday".localizable,
        "date_picker_title_friday".localizable,
        "date_picker_title_saturday".localizable
    ]
}

enum GameTabBar {
    static let favorites = "game_tab_bar_favorites".localizable
    static let hot = "game_tab_bar_hot".localizable
    static let new = "game_tab_bar_new".localizable
    static let allGame = "game_tab_bar_allGame".localizable
}

enum TransationHistory {
    enum PageTypeButton {
        static let deposit = "transation_history_pageTypeButton_deposit".localizable
        static let withdrawal = "transation_history_pageTypeButton_withdrawal".localizable
        static let quotaTransform = "transation_history_pageTypeButton_quotaTransform".localizable
        static let bonus = "transation_history_pageTypeButton_bonus".localizable
    }
    enum Label {
        static let dateSelectionHint = "transation_history_label_dateSelectionHint".localizable
        static let orderNumber = "transation_history_label_orderNumber".localizable
        static let amount = "transation_history_label_amount".localizable
        static let transationType = "transation_history_label_transationType".localizable
        static let inviteFriend = "transation_history_label_inviteFriend".localizable
        static let firstDeposit = "transation_history_label_firstDeposit".localizable
        static let rebate = "transation_history_label_rebate".localizable
        static let invitationGift = "transation_history_label_invitationGift".localizable
        static let account = "transation_history_label_account".localizable
        static let memo = "transation_history_label_memo".localizable
    }
    enum Status {
        static let fail = "transation_history_status_fail".localizable
        static let complete = "transation_history_status_complete".localizable
        static let verifying = "transation_history_status_verifying".localizable
        static let unDefine = "transation_history_status_unDefine".localizable
    }
}
enum VipOnly {
    enum pageTypeButton {
        static let myPrivilege = "vip_only_pageTypeButton_myPrivilege".localizable
        static let vipDetail = "vip_only_pageTypeButton_vipDetail".localizable
    }
    enum Label {
        static let totalDeposit = "vip_only_label_totalDeposit".localizable
        static let turnoverRequirement = "vip_only_label_turnoverRequirement".localizable
        static let keepLevelTurnoverRequirement = "vip_only_label_keepLevelTurnoverRequirement".localizable
        static let withdrawalDailyCount = "vip_only_label_withdrawalDailyCount".localizable
        static let withdrawalDailyAmount = "vip_only_label_withdrawalDailyAmount".localizable
        static let dailyWithdrawalCount = "vip_only_label_dailyWithdrawalCount".localizable
        static let dailyWithdrawalAmount = "vip_only_label_dailyWithdrawalAmount".localizable
        static let levelUpGift = "vip_only_label_levelUpGift".localizable
        static let birthdayGift = "vip_only_label_birthdayGift".localizable
        static let monthlyFreeGift = "vip_only_label_monthlyFreeGift".localizable
        static let time = "vip_only_label_time".localizable
        static let dollar = "vip_only_label_dollar".localizable
        static let canReceive = "vip_only_label_canReceive".localizable
        static let autoHandOut = "vip_only_label_autoHandOut".localizable
        static let monthlyGift = "vip_only_label_monthlyGift".localizable
        static let rebateMinTransfer = "vip_only_label_rebateMinTransfer".localizable
        static let rebateBonusPercent = "vip_only_label_rebateBonusPercent".localizable
        static let rebateMax = "vip_only_label_rebateMax".localizable
        static let rebateFrequency = "vip_only_label_rebateFrequency".localizable
        static let rebateMultiple = "vip_only_label_rebateMultiple".localizable
        static let receiveExtraBonusSuccess = "vip_only_label_receiveExtraBonusSuccess".localizable
        static let receiveExtraBonusFail = "vip_only_label_receiveExtraBonusFail".localizable
        static let receiveBonusSuccess = "vip_only_label_receiveBonusSuccess".localizable
        static let receiveBonusFail = "vip_only_label_receiveBonusFail".localizable
        static let monthly = "vip_only_label_monthly".localizable
        static let weekly = "vip_only_label_weekly".localizable
        static let currentDeposit = "vip_only_label_currentDeposit".localizable
        static let currentTurnover = "vip_only_label_currentTurnover".localizable
        static let currency = "vip_only_label_currency".localizable
        static let level = "vip_only_label_level".localizable
        static let extraBonus = "vip_only_label_extraBonus".localizable
        static let apply = "vip_only_label_apply".localizable
    }
    enum SeciontTitle {
        static let discountInfo = "vip_only_seciontTitle_discountInfo".localizable
        static let vipRebetRate = "vip_only_seciontTitle_vipRebetRate".localizable
        static let withdrawalLimit = "vip_only_seciontTitle_withdrawalLimit".localizable
    }
    enum TermsAndRule{
        static let upgradeStandard = "vip_only_termsAndRule_upgradeStandard".localizable
        static let upgradeStandardContent = "vip_only_termsAndRule_upgradeStandardContent".localizable
        static let upgradeOrder = "vip_only_termsAndRule_upgradeOrder".localizable
        static let upgradeOrderContent = "vip_only_termsAndRule_upgradeOrderContent".localizable
        static let keepLevelRequirement = "vip_only_termsAndRule_keepLevelRequirement".localizable
        static let keepLevelRequirementContent = "vip_only_termsAndRule_keepLevelRequirementContent".localizable
        static let loseLevelStandard = "vip_only_termsAndRule_loseLevelStandard".localizable
        static let loseLevelStandardContent = "vip_only_termsAndRule_loseLevelStandardContent".localizable
        static let specialDiscount = "vip_only_termsAndRule_specialDiscount".localizable
        static let specialDiscountContent = "vip_only_termsAndRule_specialDiscountContent".localizable
        static let levelUpGift = "vip_only_termsAndRule_levelUpGift".localizable
        static let levelUpGiftContent = "vip_only_termsAndRule_levelUpGiftContent".localizable
        static let birthdayGift = "vip_only_termsAndRule_birthdayGift".localizable
        static let birthdayGiftContent = "vip_only_termsAndRule_birthdayGiftContent".localizable
        static let monthlyGift = "vip_only_termsAndRule_monthlyGift".localizable
        static let monthlyGiftContent = "vip_only_termsAndRule_monthlyGiftContent".localizable
        static let levelUpPromotion = "vip_only_termsAndRule_levelUpPromotion".localizable
        static let levelUpPromotionContent = "vip_only_termsAndRule_levelUpPromotionContent".localizable
        static let footer = "vip_only_termsAndRule_footer".localizable
        static let title = "vip_only_termsAndRule_title".localizable
    }
}
enum Transation {
    enum Label {
        static let withdrawalToCard = "transation_label_withdrawalToCard".localizable
        static let withdrawalAmount = "transation_label_withdrawalAmount".localizable
        static let selectBank = "transation_label_selectBank".localizable
        static let selectLocation = "transation_label_selectLocation".localizable
        static let centerWallet = "transation_label_centerWallet".localizable
        static let gameWallet = "transation_label_gameWallet".localizable
        static let lockedWallet = "transation_label_lockedWallet".localizable
        static let transfer = "transation_label_transfer".localizable
        static let autoTransferMode = "transation_label_autoTransferMode".localizable
        static let walletTransferHint = "transation_label_walletTransferHint".localizable
        static let gfWallet = "transation_label_gfWallet".localizable
        static let chooseGameWallet = "transation_label_chooseGameWallet".localizable
        static let transferSuccess = "transation_label_transferSuccess".localizable
        static let transferFail = "transation_label_transferFail".localizable
        static let retrieveSuccess = "transation_label_retrieveSuccess".localizable
        static let retrieveFail = "transation_label_retrieveFail".localizable
        static let lockedWalletMessage = "transation_label_lockedWalletMessage".localizable
        static let withdrawalSuccess = "transation_label_withdrawalSuccess".localizable
        static let withdrawalFail = "transation_label_withdrawalFail".localizable
        static let profileNotComplete = "transation_label_profileNotComplete".localizable
        static let paymentMethod = "transation_label_paymentMethod".localizable
        static let depositAmount = "transation_label_depositAmount".localizable
        static let depositSuccess = "transation_label_depositSuccess".localizable
        static let depositFail = "transation_label_depositFail".localizable
        static let currency = "transation_label_currency".localizable
        static let withdrawalCountLimit = "transation_label_withdrawalCountLimit".localizable
        static let withdrawalAmountLimit = "transation_label_withdrawalAmountLimit".localizable
        static let withdrawalCountShort = "transation_label_withdrawalCountShort".localizable
        static let withdrawalAmountShort = "transation_label_withdrawalAmountShort".localizable
        static let depositResultMessage = "transation_label_depositResultMessage".localizable
        static let retrieveAllMessage = "transation_label_retrieveAllMessage".localizable
        static let autoTransferMessage = "transation_label_autoTransferMessage".localizable
        static let retrieveAllResultMessage = "transation_label_retrieveAllResultMessage".localizable
        static let bankCardLimit = "transation_label_bankCardLimit".localizable
        static let removeBankCard = "transation_label_removeBankCard".localizable
        static let errorBankCard = "transation_label_errorBankCard".localizable
        static let addBankCard = "transation_label_addBankCard".localizable
        static let singleDepositLimit = "transation_label_singleDepositLimit".localizable
        static let singleWithdrawalLimit = "transation_label_singleWithdrawalLimit".localizable
        static let gatewayEntity = "transation_label_gateway_entity".localizable
        static let gatewayDigital = "transation_label_gateway_digital".localizable
        static let gatewayProtocol = "transation_label_gateway_protocol".localizable
    }
    enum Button {
        static let confirmWithdrawal = "transation_button_confirmWithdrawal".localizable
        static let confirmDeopsit = "transation_button_confirmDeopsit".localizable
        static let save = "transation_button_save".localizable
        static let showHand = "transation_button_showHand".localizable
        static let transfer = "transation_button_transfer".localizable
        static let retrieveAll = "transation_button_retrieveAll".localizable
        static let cancelSelection = "transation_button_cancelSelection".localizable
        static let retrieveBatch = "transation_button_retrieveBatch".localizable
        static let walletBalance = "transation_button_walletBalance".localizable
        static let addBankCard = "transation_button_addBankCard".localizable

    }
    enum AddBankCardSection {
        static let ownerName = "transation_addBankCardSection_ownerName".localizable
        static let bank = "transation_addBankCardSection_bank".localizable
        static let bankAccountNumber = "transation_addBankCardSection_bankAccountNumber".localizable
        static let location = "transation_addBankCardSection_location".localizable
    }
    enum PlaceHolder {
        static let bank = "transation_placeHolder_bank".localizable
        static let bankAccountNumber = "transation_placeHolder_bankAccountNumber".localizable
        static let location = "transation_placeHolder_location".localizable
        static let inputAmount = "transation_placeHolder_inputAmount".localizable
        static let otherAmount = "transation_placeHolder_otherAmount".localizable
    }
    enum Title {
        static let depositInfo = "transation_title_depositInfo".localizable
        static let hint = "transation_title_hint".localizable
    }
    enum DepositResultTitle {
        static let bank = "transation_depositResultTitle_bank".localizable
        static let bankAccount = "transation_depositResultTitle_bankAccount".localizable
        static let name = "transation_depositResultTitle_name".localizable
        static let address = "transation_depositResultTitle_address".localizable
        static let remarks = "transation_depositResultTitle_remarks".localizable
    }
}
enum GameFavor {
    static let favorites = "game_favor_favorites".localizable
    static let cancelFavorites = "game_favor_cancelFavorites".localizable
    static let noFavorites = "game_favor_noFavorites".localizable
    static let noHot = "game_favor_noHot".localizable
    static let noNew = "game_favor_noNew".localizable
    static let noGame = "game_favor_noGame".localizable
}

enum GameSearch {
    static let placeholder = "game_search_placeholder".localizable
    static let searchsubtitle = "game_search_searchsubtitle".localizable
    static let searchTotal = "game_search_total".localizable
    static let searchAbout = "game_search_about".localizable
    static let searchResult = "game_search_result".localizable
}

enum GameLaunch {
    static let fullView = "game_launch_fullView".localizable
    static let underMaintain = "game_launch_fullView_under_maintain".localizable
}

enum Bonus {
    static let title:String = "bonus_title".localizable
    enum Catergory {
        static var all:String {"normalized_text_all".localizable}
        static var _1:String = "bonus_catergory_1".localizable
        static var _2:String = "bonus_catergory_2".localizable
        static var _3:String = "bonus_catergory_3".localizable
        static var _4:String = "bonus_catergory_4".localizable
    }
    enum promoButtonText {
        static let _apply = "bonus_promoButtonText_apply".localizable
        static let _redeem = "bonus_promoButtonText_redeem".localizable
        static var apply: String {"bonus_promoButtonText_applyAction".localizable}
        static var redeem:String  {"bonus_promoButtonText_redeemAction".localizable}
        static var applySuccess: String {"bonus_promoButtonText_applySuccess".localizable}
        static var redeemSuccess:String  {"bonus_promoButtonText_redeemSuccess".localizable}
        static var applyFail: String {"bonus_promoButtonText_applyFail".localizable}
        static var redeemFail:String  {"bonus_promoButtonText_redeemFail".localizable}
    }
    static let getBonus = "bonus_getBonus".localizable
    static let bonusTypeTitle = "bonus_type_title".localizable
    static let more = "bonus_label_more".localizable
}
enum Document {
    static let newbieHelp: String = "document_newbieHelp".localizable
    static let enterpise: String = ""
}

enum MessageCenter {
    static let messageList = "message_center_messageList".localizable
}

enum DefultKey {
    static let lastShowDate = "lastShowDate"
    static let lastShowAlertDate = "alerDate"
    static let prompt = "prompt"
    static let homeCsProfile = "csProfile"
}

enum RedeemHistory {
    enum PageTypeButton {
        static let deposit = "redeem_history_PageTypeButton_deposit".localizable
        static let withdrawal = "redeem_history_PageTypeButton_withdrawal".localizable
        static let quotaTransform = "redeem_history_PageTypeButton_quotaTransform".localizable
    }
    
    enum RedeemButton {
        static let add = "redeem_history_button_add_bonus".localizable
    }
    
    enum RedeemTitle {
        static let title = "redeem_history_label_title".localizable
        static let order = "redeem_history_label_order".localizable
        static let money = "redeem_history_label_money".localizable
        static let withdrawal = "redeem_history_label_withdrawal_type".localizable
        static let itemName = "redeem_history_label_item".localizable
        static let bonus = "redeem_history_label_bonus_type".localizable
    }
}

enum CustomerService {
    static let error = "customer_service_error".localizable
    static let user = "customer_service_user".localizable
    static let welcom = "customer_service_welcom".localizable
    static let addHint = "customer_service_add_hint".localizable
    static let addButtonTitle = "customer_service_add_button_title".localizable
    static let title = "customer_service_title".localizable
    static let centerTitle = "customer_service_center_title".localizable
    static let fullTimeHint = "customer_service_full_time_hint".localizable
}
enum DeviceSetting {
    enum Label {
        static let deviceSetting = "device_setting_label_deviceSetting".localizable
        static let account = "device_setting_label_account".localizable
        static let device = "device_setting_label_device".localizable
        static let ipAddress = "device_setting_label_ipAddress".localizable
        static let osVersion = "device_setting_label_osVersion".localizable
        static let appVersion = "device_setting_label_appVersion".localizable
        static let currentDate = "device_setting_label_currentDate".localizable
        static let ram = "device_setting_label_ram".localizable
        static let cache = "device_setting_label_cache".localizable
        static let temp = "device_setting_label_temp".localizable
        static let carrier = "device_setting_label_carrier".localizable
        static let deviceInfo = "device_setting_label_deviceInfo".localizable
        static let bioSettingTitle = "device_setting_label_bioSettingTitle".localizable
        static let bioSettingHint = "device_setting_label_bioSettingHint".localizable
        static let nominal = "device_setting_temp_nominal".localizable
        static let fair = "device_setting_temp_fair".localizable
        static let serious = "device_setting_temp_serious".localizable
        static let critical = "device_setting_temp_critical".localizable
    }
}

enum LobbyAdvertising {
    static let today = "advertising_showButton_today".localizable
    static let next = "advertising_showButton_next".localizable
    static let back = "advertising_showButton_back".localizable
}
        
enum LobbyAccount {
    static let account = "account_label_prompt".localizable
    static let bonus = "account_label_bonus".localizable
    static let record = "account_label_record".localizable
}

enum JoinUs {
    static let title = "joinus_label_title".localizable
    static let cooperatePlane = "joinus_cooperatePlane".localizable
    static let h1 = "joinus_h1".localizable
    static let h2 = "joinus_h2".localizable
    static let point1 = "joinus_point1".localizable
    static let point2 = "joinus_point2".localizable
    static let point3 = "joinus_point3".localizable
    static let point4 = "joinus_point1".localizable
    static let point5 = "joinus_point1".localizable
    static let point6 = "joinus_point1".localizable
    static let skype = "joinus_skype".localizable
    static let telegram = "joinus_telegram".localizable
    static let joinUsButton = "joinus_joinUsButton".localizable
}

enum Gift {
    static let title = "gigt_nav_label_title".localizable
    static let bonus = "gift_label_bonus_title".localizable
    static let bonusBack = "gift_label_bonus_back_title".localizable
    static let share = "gift_label_bonus_share_title".localizable
    static let shared = "gift_label_bonus_shared_title".localizable
    static let noShare = "gift_label_bonus_noShare_title".localizable
    static let friend = "gift_label_friend_title".localizable
    static let message = "gift_label_message_title".localizable
    static let subMessage1 = "gift_label_message_sub_title".localizable
    static let code = "gift_label_code_title".localizable
    static let button = "gift_button_share".localizable
    static let copy = "gift_button_copy".localizable
    static let download = "gift_button_download".localizable
}

enum AppUpdate {
    static let newVersion = "new_version_message".localizable
    static let versionTooOld = "version_too_old_message".localizable
}

enum Networking {
    static let unAvalibleMessage = "network_status_unavalible".localizable
}
enum Launch {
    static let second = "launch_second".localizable
    static let skip = "launch_skip".localizable
}

enum Maintenance{
    
    static let title = "maintenance_title".localizable
    
    static let customService = "maintenance_custom_service".localizable
}

enum MemberProfileForm{
    enum Title{
        //修改电子邮箱
        static let eidtEmail = "memberProfileForm_email".localizable
        //手机验证码
        static let phoneVerifyCode = "memberProfileForm_phone_verify_code".localizable
        //电子邮箱
        static let newEmail = "memberProfileForm_email".localizable
        //电子邮箱验证码
        static let emailVerifyCode = "memberProfileForm_emailVerifyCode".localizable
        //修改手机号码
        static let phone = "memberProfileForm_phone".localizable
        //手机新号码
        static let newPhone = "memberProfileForm_newPhone".localizable
        //修改取款密码
        static let withdrawalPassword = "memberProfileForm_withdrawalPassword".localizable
        //修改登录密码
        static let loginPassword = "memberProfileForm_loginPassword".localizable
        //新登录密码
        static let newPassword = "memberProfileForm_newPassword".localizable
        //确认新登录密码
        static let confirmPassword = "memberProfileForm_confirmPassword".localizable
        //新取款密码
        static let newWithdrawalPassword = "memberProfileForm_newWithdrawalPassword".localizable
        //确认新取款密码
        static let confirmWithdrawalPassword = "memberProfileForm_confirmWithdrawalPassword".localizable
        //修改开户姓名
        static let userName = "memberProfileForm_userName".localizable
        //新开户姓名
        static let newUserName = "memberProfileForm_newUserName".localizable
        //修改性别
        static let gender = "memberProfileForm_gender".localizable
        //性别
        static let newGender = "memberProfileForm_newGender".localizable
        //修改出生日期
        static let birthday = "memberProfileForm_birthday".localizable
        //出生日期
        static let newBirthday = "memberProfileForm_newBirthday".localizable
        //修改登录密码
        static let password = "memberProfileForm_password".localizable
        //修改登录密码，请先完成个人基本资料
        static let passwordHint = "memberProfileForm_password_hint".localizable
    }
    enum PlaceHolder{
        //请输入验证码
        static let verifyCode = MemberProfile.Placeholder.verifyCode
        //请输入电子邮箱
        static let newEmail = "memberProfileForm_placeHolder_email".localizable
        //请输入新手机号码
        static let phone = "memberProfileForm_placeHolder_phone".localizable
        //请输入新登录密码
        static let newPassword = "memberProfileForm_placeHolder_newPassword".localizable
        //请再次输入新登录密码
        static let confirmPassword = "memberProfileForm_placeHolder_confirmPassword".localizable
        //请输入新取款密码
        static let newWithdrawalPassword = "memberProfileForm_placeHolder_newWithdrawalPassword".localizable
        //请再次输入新取款密码
        static let confirmWithdrawalPassword = "memberProfileForm_placeHolder_confirmWithdrawalPassword".localizable
    }
    enum Button{
        //发送验证码
        static let verifyCode = MemberProfile.Button.verifyCode
    }
    enum Message{
        //验证失败
        static let verificationFail = "memberProfileForm_email_verification_fail".localizable
    }
}

//
//  NotificationExtension.swift
//  imf88
//
//  Created by Johnny on 2020/3/31.
//  Copyright © 2020 Goldenf. All rights reserved.
//

import Foundation
extension Notification.Name {
    static let shouldUpdateLoginButton = Notification.Name("com.TFChess.core:Login")
    static let shouldUpdateRegisterButton = Notification.Name("com.TFChess.core:Register")
    static let shouldUpdateVerifyCodeCountDown = Notification.Name("com.TFChess.core:shouldUpdateVerifyCodeCountDown")
    static let shouldUpdateTransationHistoryType = Notification.Name("com.TFChess.core:shouldUpdateTransationHistoryType")
    static let shouldChangeToMemberProfilePage = Notification.Name("com.TFChess.core:shouldChangeToMemberProfilePage")
    static let memberProfileDidUpdate = Notification.Name("com.TFChess.core:memberProfileDidUpdate")
    static let shouldHandleWebViewMessage = Notification.Name("com.TFChess.core:shouldHandleWebViewMessage")
    static let shouldLogout = Notification.Name("com.TFChess.core:shouldLogout")
    static let shouldReddemType = Notification.Name("com.TFChess.core:shouldReddemPressed")
    static let shouldReddemChengeTypeTitle = Notification.Name("com.TFChess.core:shouldReddemChengeTypeTitle")
}

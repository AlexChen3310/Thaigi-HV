//
/* 
 *		Created by 游宗諭 in 2021/1/29
 *		
 *		Using Swift 5.0
 *		
 *		Running on macOS 10.15
 */


import UIKit

class VerifyViewModel {
    init() throws {
        try reset()
    }
    private static let chars =
        [
            "123456789",
            //"0oO",
            "abcdefghijkmnpqrstuvwxyz",
            // "lI"
            "ABCDEFGHJKLMNPQRSTUVWXYZ",
            //"@#!%*",
        ].joined()
   private(set) var text: String = ""
    private(set) var image: UIImage!
    static let captcha = CAPTCHA { (_) -> CAPTCHA.F in
        .random(.degree(30))
    } frameXFactory: { (_) -> CAPTCHA.F in
        .random(10)
    } frameYFactory: { (_) -> CAPTCHA.F in
        .random(10)
    } fontFactory: { (_) -> UIFont in
        .systemFont(ofSize: .random(in: 18...20), weight: .bold)
    } colorFactory: { (_) -> UIColor in
        let gen = {CGFloat.random(in: 0 ... 0.5)}
        return UIColor(red: gen(), green: gen(), blue: gen(), alpha: 1)
    }
    
    func reset() throws {
        text = Self.chars
            .shuffled()[0...3]
            .map(\.description)
            .joined()
        image = try VerifyViewModel.captcha.getUIImage(targetString: text, backgroundColor: .white)
    }
}


private extension CGFloat {
    
    static func random(_ amount: CGFloat) -> CGFloat {
        let angle = Swift.abs(amount)
        return .random(in: 0...angle)
    }
    static func randomN(_ amount: CGFloat) -> CGFloat {
        let angle = Swift.abs(amount)
        return .random(in: -angle...angle)
    }
    static func degree(_ amount: CGFloat) -> CGFloat {
        .pi * amount / 180
    }
}

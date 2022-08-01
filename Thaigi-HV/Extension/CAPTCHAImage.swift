    import UIKit
    
    typealias Factory<T> = (Int) -> T
    struct CAPTCHA {
        init(
            rotateAngleFactory: @escaping Factory<CAPTCHA.F>,
            frameXFactory: @escaping Factory<CAPTCHA.F>,
            frameYFactory: @escaping Factory<CAPTCHA.F>,
            fontFactory: Factory<UIFont>?,
            colorFactory: Factory<UIColor>?
        ) {
            self.rotateAngleFactory = rotateAngleFactory
            self.frameXFactory = frameXFactory
            self.frameYFactory = frameYFactory
            self.fontFactory = fontFactory
            self.colorFactory = colorFactory
        }
        
        // MARK: - Dependencies
        
        let attributed: [NSAttributedString.Key: Any] = [:]
        typealias F = CGFloat
        let rotateAngleFactory, frameXFactory, frameYFactory: Factory<F>
        let fontFactory: Factory<UIFont>?
        let colorFactory: Factory<UIColor>?
        let offset: CGFloat = 10
        
        internal func rotateEffect(_ index: Int, midX _: CGFloat, midY _: CGFloat) -> CATransform3D {
            let angle = rotateAngleFactory(index)
            return CATransform3DMakeRotation(angle, 0, 0, 1)
        }
        
        func getUIImage(
            targetString: String,
            backgroundColor: UIColor = .clear
        ) throws -> UIImage {
            let chars = targetString
                .map(\.description)
            var lastMaxX: CGFloat = 0
            let labels: [UILabel] = chars
                .enumerated()
                .map { (index, string) -> UILabel in
                    let label = UILabel()
                    label.textAlignment = .center
                    var attributed = self.attributed
                    if let font = fontFactory?(index), attributed[.font] == nil {
                        attributed[.font] = font
                    }
                    if let color = colorFactory?(index), attributed[.foregroundColor] == nil {
                        attributed[.foregroundColor] = color
                    }
                    label.attributedText = NSAttributedString(string: string, attributes: attributed)
                    label.sizeToFit()
                    let addictionalX = frameXFactory(index) // + offset
                    let addictionalY = frameYFactory(index)
                    label.frame.origin.x = addictionalX + lastMaxX
                    label.frame.origin.y = addictionalY
                    label.bounds.size.width += addictionalX
                    label.frame.size.height += addictionalY
                    lastMaxX = label.frame.maxX
                    return label
                }
            for (index, label) in labels.enumerated() {
                label.layer.transform = rotateEffect(index, midX: label.frame.midX, midY: label.frame.midY)
            }
            let canvas = UIView()
            canvas.frame.size.height = labels.map(\.frame.maxY).max()!
            canvas.frame.size.width = lastMaxX
            canvas.backgroundColor = backgroundColor
            labels.forEach(canvas.addSubview(_:))
            return try canvas.image()
        }
    }

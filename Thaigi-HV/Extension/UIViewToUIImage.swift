//
/*
 *		Created by 游宗諭 in 2021/1/29
 *
 *		Using Swift 5.0
 *
 *		Running on macOS 10.15
 */
import UIKit
    public struct SnapshotConfiguration {
        let traitCollection: UITraitCollection

        public init(style: UIUserInterfaceStyle) {
            traitCollection = UITraitCollection(traitsFrom: [
                UITraitCollection(userInterfaceStyle: style),
            ]
            )
        }
    }

    private final class SnapshotWindow: UIWindow {
        private var configuration: SnapshotConfiguration = .init(style: .light)

        convenience init(configuration: SnapshotConfiguration, root: UIViewController) {
            self.init(frame: CGRect(origin:
                                      CGPoint(x: -root.view.frame.width, y: -root.view.frame.height), size: root.view.bounds.size))
            rootViewController = root
            isHidden = false
            self.configuration = configuration
        }

        override var traitCollection: UITraitCollection {
            UITraitCollection(traitsFrom: [super.traitCollection, configuration.traitCollection])
        }

        func snapshot() -> UIImage {
            let renderer = UIGraphicsImageRenderer(bounds: bounds, format: .init(for: traitCollection))
            return renderer.image { action in
                layer.render(in: action.cgContext)
            }
        }
    }

    public extension UIViewController {
        func snapshot(for configuration: SnapshotConfiguration) -> UIImage {
            SnapshotWindow(configuration: configuration, root: self).snapshot()
        }
    }

    extension UIView{
        public func image() throws -> UIImage {
            let root = UIViewController()
            root.view = self
            return SnapshotWindow(configuration: SnapshotConfiguration(style: .dark), root: root).snapshot()
        }

    }


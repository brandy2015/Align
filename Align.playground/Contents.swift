//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Align


typealias Stack = UIStackView

extension Stack {
    @nonobjc convenience init(style: ((UIStackView) -> Void)..., views: [UIView]) {
        self.init(arrangedSubviews: views)
        style.forEach { $0(self) }
    }
}

extension UILabel {
    @nonobjc convenience init(style: ((UILabel) -> Void)...) {
        self.init()
        style.forEach { $0(self) }
    }
}


class MyViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        let logo = UILabel(style: { $0.font = UIFont.systemFont(ofSize: 30) })
        let title = UILabel(style: { $0.font = UIFont.systemFont(ofSize: 20, weight: .bold) })
        let subtitle = UILabel(style: {
            $0.font = UIFont.systemFont(ofSize: 15)
            $0.numberOfLines = 0
        })

        let stack = Stack(
            style: { $0.spacing = 10; $0.alignment = .top },
            views: [
                logo,
                Stack(style: { $0.axis = .vertical }, views: [title, subtitle])
            ]
        )

        view.addSubview(stack)

        /// Here's code written using Align

        stack.al.center.alignWithSuperview()
        stack.al.edges(.left, .right).pinToSuperviewMargins(relation: .greaterThanOrEqual)

        logo.text = "⛵️"
        title.text = "Welcome to Align!"
        subtitle.text = "An intuitive and powerful Auto Layout"
    }
}

PlaygroundPage.current.liveView = MyViewController()

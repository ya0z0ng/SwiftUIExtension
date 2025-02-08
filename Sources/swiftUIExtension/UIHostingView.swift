//
//  UIHostingView.swift
//  swiftUIExtension
//
//  Created by Renaud Wang on 2/8/25.
//
import SwiftUI

/// HostingView allows you to use SwiftUI View in UIKit code
///
/// Warning:
/// iPhone models without SafeArea may experience extra ridges.
/// There are two ways to solve the problem: either call
/// the HostinView method hostingView.addChildControllerTo(self)
/// or use the .ignoresSafeArea() method in SwiftUI View.
public final class UIHostingView<T: View>: UIView {

    private(set) var hostingController: UIHostingController<T>

    public var rootView: T {
        get { hostingController.rootView }
        set { hostingController.rootView = newValue }
    }

    public init(rootView: T, frame: CGRect = .zero) {
        hostingController = UIHostingController(rootView: rootView)

        super.init(frame: frame)

        backgroundColor = .clear
        hostingController.view.backgroundColor = backgroundColor
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(hostingController.view)
    }
    
    public override var intrinsicContentSize: CGSize {
        hostingController.view.intrinsicContentSize
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func addChildControllerTo(_ controller: UIViewController) {
        controller.addChild(hostingController)
        hostingController.didMove(toParent: controller)
    }

    public func removeChildControllerTo(_ controller: UIViewController) {
        hostingController.willMove(toParent: nil)
        hostingController.removeFromParent()
    }
}

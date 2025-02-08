//
//  Button+Extension.swift
//  swiftUIExtension
//
//  Created by Renaud Wang on 2/8/25.
//
import SwiftUI

@available(iOS 13.0, *)
public extension View {
    @ViewBuilder func `if`<T>(_ condition: Bool, transform: (_ content: Self) -> T) -> some View where T : View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

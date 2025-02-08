//
//  Button+Extension.swift
//  swiftUIExtension
//
//  Created by Renaud Wang on 2/8/25.
//
import SwiftUI

@available(iOS 13.0, *)
public extension Button where Label == Image {

    /// Creates a button with a specified role that generates its label from a system image.
    ///
    /// - Parameters:
    ///   - systemImage: The name of the image resource to lookup.
    ///   - role: An optional semantic role describing the button. A value of
    ///     `nil` means that the button doesn't have an assigned role.
    ///   - action: The action to perform when the user triggers the button.
    @available(iOS 15.0, *)
    init(systemImage: String, role: ButtonRole? = nil, action: @escaping @MainActor () -> Void) {
        self.init(action: action) {
            Image(systemName: systemImage)
        }
    }
}


@available(iOS 13.0, *)
#Preview {
    List {
        HStack(spacing: 10) {
            if #available(iOS 15.0, *) {
                Button(systemImage: "plus") {}.buttonStyle(.bordered)
                Button(systemImage: "plus") {}.buttonStyle(.borderedProminent)
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

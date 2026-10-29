//
//  TVFocusButtonStyle.swift
//  VTVGoTV
//

import SwiftUI

/// Button style tvOS: phóng to + viền trắng khi nhận focus từ Siri Remote.
struct TVFocusButtonStyle: ButtonStyle {
    var scale: CGFloat = 1.08
    var cornerRadius: CGFloat = AppTheme.cardCornerRadius

    func makeBody(configuration: Configuration) -> some View {
        FocusLabel(
            configuration: configuration,
            scale: scale,
            cornerRadius: cornerRadius
        )
    }

    private struct FocusLabel: View {
        let configuration: ButtonStyle.Configuration
        let scale: CGFloat
        let cornerRadius: CGFloat
        @Environment(\.isFocused) private var isFocused

        var body: some View {
            configuration.label
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .strokeBorder(AppTheme.focusBorder, lineWidth: isFocused ? 4 : 0)
                )
                .scaleEffect(isFocused ? scale : 1.0)
                .shadow(
                    color: .black.opacity(isFocused ? 0.5 : 0.2),
                    radius: isFocused ? 18 : 6,
                    y: isFocused ? 10 : 6
                )
                .opacity(configuration.isPressed ? 0.9 : 1.0)
                .animation(.easeOut(duration: 0.15), value: isFocused)
        }
    }
}

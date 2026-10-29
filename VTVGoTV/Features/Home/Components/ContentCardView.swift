//
//  ContentCardView.swift
//  VTVGoTV
//

import SwiftUI

struct ContentCardView: View {
    let item: ContentItem
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 12) {
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: AppTheme.cardCornerRadius, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: [
                                    item.accentColor.opacity(0.9),
                                    item.accentColor.opacity(0.4),
                                    AppTheme.surfaceElevated
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )

                    Image(systemName: item.symbolName)
                        .font(.system(size: 56, weight: .light))
                        .foregroundStyle(.white.opacity(0.35))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)

                    if let badge = item.durationLabel {
                        Text(badge)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(
                                Capsule().fill(
                                    item.isLive ? AppTheme.liveBadge : Color.black.opacity(0.55)
                                )
                            )
                            .padding(14)
                    }
                }
                .frame(width: AppTheme.contentCardSize.width, height: AppTheme.contentCardSize.height)

                VStack(alignment: .leading, spacing: 4) {
                    Text(item.title)
                        .font(.system(size: 26, weight: .semibold))
                        .foregroundStyle(AppTheme.textPrimary)
                        .lineLimit(1)
                    Text(item.subtitle)
                        .font(.system(size: 20, weight: .regular))
                        .foregroundStyle(AppTheme.textSecondary)
                        .lineLimit(1)
                }
                .frame(width: AppTheme.contentCardSize.width, alignment: .leading)
            }
        }
        .buttonStyle(TVFocusButtonStyle(scale: 1.06))
        .accessibilityLabel("\(item.title), \(item.subtitle)")
    }
}

//
//  FeaturedHeroView.swift
//  VTVGoTV
//

import SwiftUI

struct FeaturedHeroView: View {
    let item: ContentItem
    let onPlay: () -> Void

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            LinearGradient(
                colors: [
                    item.accentColor.opacity(0.85),
                    AppTheme.background.opacity(0.2),
                    AppTheme.background
                ],
                startPoint: .topTrailing,
                endPoint: .bottomLeading
            )

            HStack(alignment: .bottom, spacing: 40) {
                VStack(alignment: .leading, spacing: 18) {
                    if item.isLive {
                        Label("ĐANG PHÁT SÓNG", systemImage: "circle.fill")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(AppTheme.liveBadge)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(Capsule().fill(Color.black.opacity(0.45)))
                    }

                    Text(item.title)
                        .font(.system(size: 64, weight: .bold))
                        .foregroundStyle(AppTheme.textPrimary)
                        .lineLimit(2)

                    Text(item.subtitle)
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundStyle(AppTheme.textSecondary)

                    Text(item.description)
                        .font(.system(size: 24, weight: .regular))
                        .foregroundStyle(AppTheme.textTertiary)
                        .lineLimit(2)
                        .frame(maxWidth: 720, alignment: .leading)

                    Button(action: onPlay) {
                        Label("Xem ngay", systemImage: "play.fill")
                            .font(.system(size: 28, weight: .bold))
                            .padding(.horizontal, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(AppTheme.brandRed)
                    .padding(.top, 8)
                }

                Spacer(minLength: 0)

                Image(systemName: item.symbolName)
                    .font(.system(size: 140, weight: .light))
                    .foregroundStyle(.white.opacity(0.28))
                    .padding(.trailing, 40)
                    .padding(.bottom, 30)
            }
            .padding(.horizontal, 60)
            .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity)
        .frame(height: AppTheme.heroHeight)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .padding(.horizontal, 60)
    }
}

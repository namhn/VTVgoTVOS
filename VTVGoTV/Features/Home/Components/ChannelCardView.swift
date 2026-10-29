//
//  ChannelCardView.swift
//  VTVGoTV
//

import SwiftUI

struct ChannelCardView: View {
    let channel: Channel
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack(alignment: .bottomLeading) {
                RoundedRectangle(cornerRadius: AppTheme.cardCornerRadius, style: .continuous)
                    .fill(
                        LinearGradient(
                            colors: [
                                channel.brandColor.opacity(0.95),
                                channel.brandColor.opacity(0.55),
                                AppTheme.surface
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )

                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: channel.symbolName)
                            .font(.system(size: 36, weight: .semibold))
                            .foregroundStyle(.white)
                        Spacer()
                        if channel.isLive {
                            Text("LIVE")
                                .font(.system(size: 14, weight: .heavy))
                                .foregroundStyle(.white)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Capsule().fill(AppTheme.liveBadge))
                        }
                    }

                    Spacer(minLength: 0)

                    Text(channel.name)
                        .font(.system(size: 26, weight: .bold))
                        .foregroundStyle(AppTheme.textPrimary)
                    Text(channel.category)
                        .font(.system(size: 18, weight: .medium))
                        .foregroundStyle(AppTheme.textSecondary)
                }
                .padding(18)
            }
            .frame(width: AppTheme.channelCardSize.width, height: AppTheme.channelCardSize.height)
        }
        .buttonStyle(TVFocusButtonStyle())
        .accessibilityLabel("\(channel.name), \(channel.category)")
    }
}

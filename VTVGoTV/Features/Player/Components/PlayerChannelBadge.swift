//
//  PlayerChannelBadge.swift
//  VTVGoTV
//

import SwiftUI

/// Logo kênh góc trên trái — phong cách VTV + số đỏ như màn hình mẫu.
struct PlayerChannelBadge: View {
    let channelName: String

    private var numberSuffix: String {
        let digits = channelName.filter(\.isNumber)
        return digits.isEmpty ? "" : digits
    }

    private var brandPrefix: String {
        let trimmed = channelName.filter { !$0.isNumber }
        return trimmed.isEmpty ? channelName : trimmed
    }

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 2) {
            Text(brandPrefix)
                .font(.system(size: 42, weight: .heavy, design: .rounded))
                .foregroundStyle(.white)
                .shadow(color: .black.opacity(0.55), radius: 4, y: 2)

            if !numberSuffix.isEmpty {
                Text(numberSuffix)
                    .font(.system(size: 48, weight: .heavy, design: .rounded))
                    .foregroundStyle(AppTheme.brandRed)
                    .shadow(color: .black.opacity(0.55), radius: 4, y: 2)
            }
        }
        .accessibilityLabel(channelName)
    }
}

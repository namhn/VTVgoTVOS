//
//  ChannelRowView.swift
//  VTVGoTV
//

import SwiftUI

struct ChannelRowView: View {
    let channels: [Channel]
    let onSelect: (Channel) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Kênh truyền hình")
                .font(.system(size: 34, weight: .bold))
                .foregroundStyle(AppTheme.textPrimary)
                .padding(.horizontal, 60)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 28) {
                    ForEach(channels) { channel in
                        ChannelCardView(channel: channel) {
                            onSelect(channel)
                        }
                    }
                }
                .padding(.horizontal, 60)
                .padding(.vertical, 16)
            }
            .focusSection()
        }
    }
}

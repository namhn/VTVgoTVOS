//
//  ChannelsView.swift
//  VTVGoTV
//

import SwiftUI

struct ChannelsView: View {
    var channels: [Channel] = MockHomeData.channels
    var onSelect: (Channel) -> Void = { _ in }

    private let columns = [
        GridItem(.adaptive(minimum: 220), spacing: 28)
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 28) {
                Text("Tất cả kênh")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundStyle(AppTheme.textPrimary)
                    .padding(.horizontal, 60)

                LazyVGrid(columns: columns, spacing: 28) {
                    ForEach(channels) { channel in
                        ChannelCardView(channel: channel) {
                            onSelect(channel)
                        }
                    }
                }
                .padding(.horizontal, 60)
                .padding(.bottom, 60)
            }
            .padding(.top, 20)
        }
        .focusSection()
    }
}

#Preview {
    ZStack {
        AppTheme.background.ignoresSafeArea()
        ChannelsView()
    }
    .preferredColorScheme(.dark)
}

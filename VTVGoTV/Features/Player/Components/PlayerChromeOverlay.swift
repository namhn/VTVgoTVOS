//
//  PlayerChromeOverlay.swift
//  VTVGoTV
//

import SwiftUI

struct PlayerChromeOverlay: View {
    let session: PlaybackSession
    var isVisible: Bool

    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                Spacer()
                bottomGradient
            }
            .opacity(isVisible ? 1 : 0)

            PlayerChannelBadge(channelName: session.channelName)
                .padding(.leading, 56)
                .padding(.top, 40)
                .opacity(isVisible ? 1 : 0)

            VStack {
                Spacer()
                HStack(alignment: .bottom, spacing: 40) {
                    PlayerProgramInfoView(session: session)
                    Spacer(minLength: 20)
                    PlayerRemoteGuideView()
                }
                .padding(.horizontal, 56)
                .padding(.bottom, 48)
            }
            .opacity(isVisible ? 1 : 0)
        }
        .animation(.easeInOut(duration: 0.25), value: isVisible)
        .allowsHitTesting(isVisible)
    }

    private var bottomGradient: some View {
        LinearGradient(
            colors: [
                .clear,
                Color.black.opacity(0.35),
                Color.black.opacity(0.78)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
        .frame(height: 360)
        .allowsHitTesting(false)
    }
}

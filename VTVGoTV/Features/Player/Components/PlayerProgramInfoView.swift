//
//  PlayerProgramInfoView.swift
//  VTVGoTV
//

import SwiftUI

struct PlayerProgramInfoView: View {
    let session: PlaybackSession

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(session.channelNumber)
                .font(.system(size: 28, weight: .semibold))
                .foregroundStyle(Color.white.opacity(0.9))

            Text(session.channelName)
                .font(.system(size: 44, weight: .bold))
                .foregroundStyle(.white)

            Text(session.programTitle)
                .font(.system(size: 26, weight: .regular))
                .foregroundStyle(Color.white.opacity(0.92))
                .lineLimit(2)

            PlayerProgressBar(
                progress: session.progress,
                startLabel: session.programStartLabel,
                endLabel: session.programEndLabel
            )
            .frame(maxWidth: 520)
            .padding(.top, 8)
        }
        .frame(maxWidth: 560, alignment: .leading)
    }
}

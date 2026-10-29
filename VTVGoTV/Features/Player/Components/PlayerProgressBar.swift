//
//  PlayerProgressBar.swift
//  VTVGoTV
//

import SwiftUI

struct PlayerProgressBar: View {
    let progress: Double
    let startLabel: String
    let endLabel: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            GeometryReader { geo in
                let width = geo.size.width
                let filled = max(0, min(1, progress)) * width

                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color.white.opacity(0.28))
                        .frame(height: 6)

                    Capsule()
                        .fill(AppTheme.brandRed)
                        .frame(width: filled, height: 6)
                }
            }
            .frame(height: 6)

            HStack {
                Text(startLabel)
                Spacer()
                Text(endLabel)
            }
            .font(.system(size: 22, weight: .medium))
            .foregroundStyle(Color.white.opacity(0.85))
        }
    }
}

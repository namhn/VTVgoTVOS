//
//  PlayerRemoteGuideView.swift
//  VTVGoTV
//

import SwiftUI

struct PlayerRemoteGuideView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 28) {
            dpadGraphic

            VStack(alignment: .leading, spacing: 14) {
                guideRow {
                    Image(systemName: "chevron.up")
                        .font(.system(size: 15, weight: .bold))
                } text: {
                    Text("để xem lịch phát sóng")
                }

                guideRow {
                    Image(systemName: "chevron.down")
                        .font(.system(size: 15, weight: .bold))
                } text: {
                    Text("để hiển thị thanh điều khiển")
                }

                guideRow {
                    Text("OK")
                        .font(.system(size: 16, weight: .bold))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4, style: .continuous)
                                .strokeBorder(Color.white.opacity(0.7), lineWidth: 1)
                        )
                } text: {
                    Text("để mở danh sách kênh")
                }

                guideRow {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                        Image(systemName: "chevron.right")
                    }
                    .font(.system(size: 15, weight: .bold))
                } text: {
                    Text("để tua nội dung")
                }
            }
        }
    }

    private func guideRow<Icon: View, Caption: View>(
        @ViewBuilder icon: () -> Icon,
        @ViewBuilder text: () -> Caption
    ) -> some View {
        HStack(spacing: 8) {
            Text("Bấm")
            icon()
            text()
        }
        .font(.system(size: 22, weight: .medium))
        .foregroundStyle(Color.white.opacity(0.9))
    }

    private var dpadGraphic: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color.black.opacity(0.45))
                .overlay(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .strokeBorder(Color.white.opacity(0.18), lineWidth: 1)
                )

            VStack(spacing: 10) {
                Image(systemName: "chevron.up")
                HStack(spacing: 18) {
                    Image(systemName: "chevron.left")
                    Text("OK")
                        .font(.system(size: 20, weight: .bold))
                        .frame(width: 44, height: 44)
                        .background(Circle().strokeBorder(Color.white.opacity(0.65), lineWidth: 2))
                    Image(systemName: "chevron.right")
                }
                Image(systemName: "chevron.down")
            }
            .font(.system(size: 18, weight: .semibold))
            .foregroundStyle(Color.white.opacity(0.85))
        }
        .frame(width: 150, height: 150)
        .accessibilityHidden(true)
    }
}

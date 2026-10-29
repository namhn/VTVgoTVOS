//
//  PlayerView.swift
//  VTVGoTV
//

import SwiftUI

struct PlayerView: View {
    @State private var viewModel: PlayerViewModel
    @Environment(\.dismiss) private var dismiss
    @FocusState private var isRemoteFocused: Bool

    init(session: PlaybackSession = .demoVTV1) {
        _viewModel = State(initialValue: PlayerViewModel(session: session))
    }

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            videoLayer

            // Nút trong suốt nhận Select / OK và giữ focus cho lệnh remote.
            Button {
                viewModel.handleRemote(.showChannelList)
            } label: {
                Color.clear
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            .focused($isRemoteFocused)
            .accessibilityLabel("Mở danh sách kênh")

            PlayerChromeOverlay(
                session: viewModel.session,
                isVisible: viewModel.isChromeVisible
            )
            .allowsHitTesting(false)

            if let toast = viewModel.toastMessage {
                toastBanner(toast)
            }

            if case .failed(let message) = viewModel.playback.status {
                errorBanner(message)
            }
        }
        .onAppear {
            isRemoteFocused = true
            viewModel.onAppear()
        }
        .onDisappear(perform: viewModel.onDisappear)
        .onMoveCommand(perform: handleMove)
        .onPlayPauseCommand {
            switch viewModel.playback.status {
            case .playing:
                viewModel.playback.pause()
            default:
                viewModel.playback.play()
            }
            viewModel.revealChrome()
        }
        .onExitCommand {
            dismiss()
        }
        .sheet(isPresented: $viewModel.showChannelList) {
            channelListSheet
        }
    }

    @ViewBuilder
    private var videoLayer: some View {
        if viewModel.playback.player != nil {
            PlayerVideoSurface(player: viewModel.playback.player)
                .ignoresSafeArea()
        } else {
            placeholderSurface
        }
    }

    private var placeholderSurface: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.12, green: 0.18, blue: 0.28),
                    Color.black
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            if viewModel.playback.status == .loading {
                ProgressView()
                    .tint(.white)
                    .scaleEffect(1.4)
            }
        }
        .ignoresSafeArea()
    }

    private var channelListSheet: some View {
        NavigationStack {
            List(MockHomeData.channels) { channel in
                HStack {
                    Text(channel.name)
                        .font(.headline)
                    Spacer()
                    if channel.isLive {
                        Text("LIVE")
                            .font(.caption.weight(.bold))
                            .foregroundStyle(AppTheme.liveBadge)
                    }
                }
            }
            .navigationTitle("Danh sách kênh")
        }
    }

    private func toastBanner(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 26, weight: .semibold))
            .foregroundStyle(.white)
            .padding(.horizontal, 28)
            .padding(.vertical, 16)
            .background(Capsule().fill(Color.black.opacity(0.65)))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.top, 120)
    }

    private func errorBanner(_ message: String) -> some View {
        VStack(spacing: 16) {
            Text("Không phát được video")
                .font(.system(size: 34, weight: .bold))
            Text(message)
                .font(.system(size: 24))
                .foregroundStyle(AppTheme.textSecondary)
                .multilineTextAlignment(.center)
            Text("Giao diện overlay vẫn hiển thị. Stream production sẽ gắn sau.")
                .font(.system(size: 20))
                .foregroundStyle(AppTheme.textTertiary)
        }
        .foregroundStyle(.white)
        .padding(40)
        .background(RoundedRectangle(cornerRadius: 16).fill(Color.black.opacity(0.72)))
        .padding(80)
    }

    private func handleMove(_ direction: MoveCommandDirection) {
        switch direction {
        case .up:
            viewModel.handleRemote(.showEPG)
        case .down:
            viewModel.handleRemote(.showControls)
        case .left:
            viewModel.handleRemote(.seekBackward)
        case .right:
            viewModel.handleRemote(.seekForward)
        @unknown default:
            break
        }
    }
}

#Preview("Player · VTV1") {
    PlayerView(session: .demoVTV1)
}

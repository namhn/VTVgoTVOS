//
//  PlayerViewModel.swift
//  VTVGoTV
//

import Foundation
import Observation

enum PlayerChromeAction: Equatable {
    case showEPG
    case showControls
    case showChannelList
    case seekBackward
    case seekForward
}

@Observable
@MainActor
final class PlayerViewModel {
    let session: PlaybackSession
    let playback: PlaybackController

    var isChromeVisible = true
    var toastMessage: String?
    var showChannelList = false

    private var hideTask: Task<Void, Never>?

    init(session: PlaybackSession, playback: PlaybackController? = nil) {
        self.session = session
        self.playback = playback ?? PlaybackController()
    }

    func onAppear() {
        playback.load(url: session.streamURL)
        scheduleChromeAutoHide()
    }

    func onDisappear() {
        hideTask?.cancel()
        playback.tearDown()
    }

    func handleRemote(_ action: PlayerChromeAction) {
        switch action {
        case .showEPG:
            revealChrome()
            toastMessage = "Lịch phát sóng sẽ mở ở giai đoạn sau."
        case .showControls:
            revealChrome()
            toastMessage = nil
        case .showChannelList:
            revealChrome()
            showChannelList = true
        case .seekBackward:
            revealChrome()
            playback.seekBy(seconds: -10)
            toastMessage = "Tua lại 10 giây"
        case .seekForward:
            revealChrome()
            playback.seekBy(seconds: 10)
            toastMessage = "Tua tới 10 giây"
        }
        clearToastLater()
    }

    func revealChrome() {
        isChromeVisible = true
        scheduleChromeAutoHide()
    }

    func toggleChrome() {
        isChromeVisible.toggle()
        if isChromeVisible {
            scheduleChromeAutoHide()
        } else {
            hideTask?.cancel()
        }
    }

    private func scheduleChromeAutoHide() {
        hideTask?.cancel()
        hideTask = Task {
            try? await Task.sleep(nanoseconds: 6_000_000_000)
            guard !Task.isCancelled else { return }
            isChromeVisible = false
        }
    }

    private func clearToastLater() {
        Task {
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            toastMessage = nil
        }
    }
}

//
//  PlaybackController.swift
//  VTVGoTV
//

import AVFoundation
import Observation

enum PlaybackStatus: Equatable {
    case idle
    case loading
    case playing
    case paused
    case failed(String)
}

@Observable
@MainActor
final class PlaybackController {
    private(set) var player: AVPlayer?
    private(set) var status: PlaybackStatus = .idle

    private var itemObserver: NSKeyValueObservation?
    private var statusObserver: NSKeyValueObservation?

    func load(url: URL?) {
        tearDown()

        guard let url else {
            status = .idle
            return
        }

        status = .loading
        let item = AVPlayerItem(url: url)
        let newPlayer = AVPlayer(playerItem: item)
        newPlayer.actionAtItemEnd = .none

        itemObserver = item.observe(\.status, options: [.new]) { [weak self] item, _ in
            let status = item.status
            let error = item.error
            Task { @MainActor [weak self] in
                self?.handleItemStatus(status, error: error)
            }
        }

        player = newPlayer
        newPlayer.play()
        status = .playing
    }

    func play() {
        player?.play()
        status = .playing
    }

    func pause() {
        player?.pause()
        status = .paused
    }

    func seekBy(seconds: Double) {
        guard let player, let item = player.currentItem else { return }
        let current = player.currentTime()
        let target = CMTimeGetSeconds(current) + seconds
        let duration = CMTimeGetSeconds(item.duration)
        let clamped: Double
        if duration.isFinite, duration > 0 {
            clamped = min(max(0, target), duration)
        } else {
            clamped = max(0, target)
        }
        player.seek(to: CMTime(seconds: clamped, preferredTimescale: 600))
    }

    func tearDown() {
        itemObserver?.invalidate()
        statusObserver?.invalidate()
        itemObserver = nil
        statusObserver = nil
        player?.pause()
        player?.replaceCurrentItem(with: nil)
        player = nil
        status = .idle
    }

    private func handleItemStatus(_ itemStatus: AVPlayerItem.Status, error: Error?) {
        switch itemStatus {
        case .readyToPlay:
            if status == .loading { status = .playing }
        case .failed:
            let message = error?.localizedDescription ?? "Không phát được luồng video."
            status = .failed(message)
        case .unknown:
            break
        @unknown default:
            break
        }
    }
}

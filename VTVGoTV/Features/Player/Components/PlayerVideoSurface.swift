//
//  PlayerVideoSurface.swift
//  VTVGoTV
//

import AVKit
import SwiftUI

/// Bề mặt video full-screen, ẩn control mặc định để dùng chrome riêng theo thiết kế VTVGo.
struct PlayerVideoSurface: UIViewControllerRepresentable {
    let player: AVPlayer?

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.showsPlaybackControls = false
        controller.allowsPictureInPicturePlayback = false
        controller.view.backgroundColor = .black
        return controller
    }

    func updateUIViewController(_ controller: AVPlayerViewController, context: Context) {
        if controller.player !== player {
            controller.player = player
        }
    }

    static func dismantleUIViewController(_ controller: AVPlayerViewController, coordinator: ()) {
        controller.player?.pause()
        controller.player = nil
    }
}

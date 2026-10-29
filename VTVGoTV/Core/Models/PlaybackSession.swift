//
//  PlaybackSession.swift
//  VTVGoTV
//
//  Phiên phát — dữ liệu hiển thị player. Stream URL chỉ dùng fixture test
//  đã đánh dấu rõ, chưa phải HLS production VTVGo.
//

import Foundation

struct PlaybackSession: Identifiable, Hashable {
    let id: String
    let channelNumber: String
    let channelName: String
    let programTitle: String
    let programStartLabel: String
    let programEndLabel: String
    /// 0...1 tiến độ chương trình trong khung giờ (mock / lịch).
    let progress: Double
    /// nil = chỉ UI overlay + nền placeholder; có URL = AVPlayer (test fixture).
    let streamURL: URL?

    /// Apple HLS sample — fixture công khai để kiểm tra AVPlayer trên Simulator.
    /// Không phải stream production VTVGo.
    static let appleSampleHLS = URL(
        string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8"
    )

    static func from(channel: Channel, number: Int) -> PlaybackSession {
        PlaybackSession(
            id: channel.id,
            channelNumber: String(format: "%03d", number),
            channelName: channel.name,
            programTitle: channel.isLive ? "Đang phát sóng trực tiếp" : "Chương trình đã ghi",
            programStartLabel: "19:00",
            programEndLabel: "19:40",
            progress: 0.42,
            streamURL: Self.appleSampleHLS
        )
    }

    static func from(content: ContentItem, channelName: String = "VTV1") -> PlaybackSession {
        PlaybackSession(
            id: content.id,
            channelNumber: "001",
            channelName: channelName,
            programTitle: content.title,
            programStartLabel: "19:00",
            programEndLabel: "19:40",
            progress: content.isLive ? 0.55 : 0.2,
            streamURL: Self.appleSampleHLS
        )
    }

    /// Session demo khớp màn hình mẫu (VTV1 · Bản tin thời sự 19h).
    static let demoVTV1 = PlaybackSession(
        id: "demo-vtv1",
        channelNumber: "001",
        channelName: "VTV1",
        programTitle: "Bản tin thời sự 19h",
        programStartLabel: "19:00",
        programEndLabel: "19:40",
        progress: 0.48,
        streamURL: appleSampleHLS
    )
}

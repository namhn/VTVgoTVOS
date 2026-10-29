//
//  Channel.swift
//  VTVGoTV
//

import Foundation
import SwiftUI

struct Channel: Identifiable, Hashable, Codable {
    let id: String
    let name: String
    let shortName: String
    let category: String
    let isLive: Bool
    /// SF Symbol dùng làm placeholder logo giai đoạn mock.
    let symbolName: String
    /// Màu nhận diện kênh (hex RGB, ví dụ 0xE31C25).
    let brandColorHex: UInt32
    let logoURL: URL?
    let streamURL: URL?

    var brandColor: Color {
        Color(
            red: Double((brandColorHex >> 16) & 0xFF) / 255,
            green: Double((brandColorHex >> 8) & 0xFF) / 255,
            blue: Double(brandColorHex & 0xFF) / 255
        )
    }
}

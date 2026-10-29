//
//  ContentItem.swift
//  VTVGoTV
//

import Foundation
import SwiftUI

struct ContentItem: Identifiable, Hashable, Codable {
    let id: String
    let title: String
    let subtitle: String
    let description: String
    let symbolName: String
    let accentColorHex: UInt32
    let isLive: Bool
    let durationLabel: String?

    var accentColor: Color {
        Color(
            red: Double((accentColorHex >> 16) & 0xFF) / 255,
            green: Double((accentColorHex >> 8) & 0xFF) / 255,
            blue: Double(accentColorHex & 0xFF) / 255
        )
    }
}

struct ContentRow: Identifiable, Hashable, Codable {
    let id: String
    let title: String
    let items: [ContentItem]
}

enum HomeNavItem: String, CaseIterable, Identifiable, Hashable {
    case home = "Trang chủ"
    case channels = "Kênh"
    case search = "Tìm kiếm"

    var id: String { rawValue }

    var symbolName: String {
        switch self {
        case .home: return "house.fill"
        case .channels: return "tv.fill"
        case .search: return "magnifyingglass"
        }
    }
}

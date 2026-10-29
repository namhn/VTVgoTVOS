//
//  AppTheme.swift
//  VTVGoTV
//

import SwiftUI

enum AppTheme {
    static let brandRed = Color(red: 200 / 255, green: 16 / 255, blue: 46 / 255)
    static let background = Color(red: 10 / 255, green: 10 / 255, blue: 14 / 255)
    static let surface = Color(red: 22 / 255, green: 22 / 255, blue: 28 / 255)
    static let surfaceElevated = Color(red: 32 / 255, green: 32 / 255, blue: 40 / 255)
    static let textPrimary = Color.white
    static let textSecondary = Color.white.opacity(0.72)
    static let textTertiary = Color.white.opacity(0.45)
    static let focusBorder = Color.white
    static let liveBadge = Color(red: 220 / 255, green: 38 / 255, blue: 38 / 255)

    static let topBarHeight: CGFloat = 96
    static let heroHeight: CGFloat = 420
    static let channelCardSize = CGSize(width: 220, height: 140)
    static let contentCardSize = CGSize(width: 360, height: 220)
    static let sectionSpacing: CGFloat = 48
    static let cardCornerRadius: CGFloat = 12
}

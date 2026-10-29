//
//  HomeTopBar.swift
//  VTVGoTV
//

import SwiftUI

struct HomeTopBar: View {
    @Binding var selectedNav: HomeNavItem

    var body: some View {
        HStack(spacing: 36) {
            brandLogo

            HStack(spacing: 20) {
                ForEach(HomeNavItem.allCases) { item in
                    Button {
                        selectedNav = item
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: item.symbolName)
                                .font(.system(size: 22, weight: .semibold))
                            Text(item.rawValue)
                                .font(.system(size: 28, weight: .semibold))
                        }
                        .foregroundStyle(
                            selectedNav == item
                                ? AppTheme.textPrimary
                                : AppTheme.textSecondary
                        )
                        .padding(.horizontal, 22)
                        .padding(.vertical, 14)
                        .background(
                            Capsule()
                                .fill(selectedNav == item ? AppTheme.brandRed.opacity(0.35) : Color.clear)
                        )
                    }
                    .buttonStyle(.plain)
                }
            }

            Spacer(minLength: 0)
        }
        .padding(.horizontal, 60)
        .frame(height: AppTheme.topBarHeight)
    }

    private var brandLogo: some View {
        HStack(spacing: 14) {
            ZStack {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(AppTheme.brandRed)
                    .frame(width: 56, height: 56)
                Text("VTV")
                    .font(.system(size: 18, weight: .black, design: .rounded))
                    .foregroundStyle(.white)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text("VTV Go")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundStyle(AppTheme.textPrimary)
                Text("Truyền hình số")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(AppTheme.textTertiary)
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("VTV Go")
    }
}

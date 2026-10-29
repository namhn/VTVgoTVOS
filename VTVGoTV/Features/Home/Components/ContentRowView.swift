//
//  ContentRowView.swift
//  VTVGoTV
//

import SwiftUI

struct ContentRowView: View {
    let row: ContentRow
    let onSelect: (ContentItem) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(row.title)
                .font(.system(size: 34, weight: .bold))
                .foregroundStyle(AppTheme.textPrimary)
                .padding(.horizontal, 60)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 28) {
                    ForEach(row.items) { item in
                        ContentCardView(item: item) {
                            onSelect(item)
                        }
                    }
                }
                .padding(.horizontal, 60)
                .padding(.vertical, 16)
            }
            .focusSection()
        }
    }
}

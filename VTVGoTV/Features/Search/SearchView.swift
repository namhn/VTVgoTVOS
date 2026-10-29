//
//  SearchView.swift
//  VTVGoTV
//

import SwiftUI

struct SearchView: View {
    @State private var query = ""

    var body: some View {
        VStack(spacing: 28) {
            Text("Tìm kiếm")
                .font(.system(size: 40, weight: .bold))
                .foregroundStyle(AppTheme.textPrimary)

            TextField("Nhập tên kênh hoặc chương trình", text: $query)
                .font(.system(size: 28))
                .frame(maxWidth: 800)

            Text("Chức năng tìm kiếm sẽ được hoàn thiện ở giai đoạn sau.")
                .font(.system(size: 24))
                .foregroundStyle(AppTheme.textTertiary)

            Spacer()
        }
        .padding(.top, 40)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ZStack {
        AppTheme.background.ignoresSafeArea()
        SearchView()
    }
    .preferredColorScheme(.dark)
}

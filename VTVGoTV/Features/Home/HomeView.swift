//
//  HomeView.swift
//  VTVGoTV
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()

    var body: some View {
        ZStack {
            AppTheme.background.ignoresSafeArea()

            VStack(spacing: 0) {
                HomeTopBar(selectedNav: $viewModel.selectedNav)

                Group {
                    switch viewModel.selectedNav {
                    case .home:
                        homeContent
                    case .channels:
                        ChannelsView(channels: viewModel.channels) { channel in
                            viewModel.selectChannel(channel)
                        }
                    case .search:
                        SearchView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .preferredColorScheme(.dark)
        .task {
            await viewModel.load()
        }
        .fullScreenCover(item: $viewModel.activePlayback) { session in
            PlayerView(session: session)
        }
    }

    private var homeContent: some View {
        Group {
            if viewModel.isLoading && viewModel.featured == nil {
                ProgressView("Đang tải…")
                    .tint(.white)
                    .foregroundStyle(AppTheme.textSecondary)
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: AppTheme.sectionSpacing) {
                        if let featured = viewModel.featured {
                            FeaturedHeroView(item: featured) {
                                viewModel.playFeatured()
                            }
                            .focusSection()
                        }

                        ChannelRowView(channels: viewModel.channels) { channel in
                            viewModel.selectChannel(channel)
                        }

                        ForEach(viewModel.contentRows) { row in
                            ContentRowView(row: row) { item in
                                viewModel.selectContent(item)
                            }
                        }
                    }
                    .padding(.bottom, 80)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

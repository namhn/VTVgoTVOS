//
//  HomeViewModel.swift
//  VTVGoTV
//

import Foundation
import Observation

@Observable
@MainActor
final class HomeViewModel {
    private let repository: HomeRepositoryProtocol

    var selectedNav: HomeNavItem = .home
    var featured: ContentItem?
    var channels: [Channel] = []
    var contentRows: [ContentRow] = []
    var isLoading = false
    var activePlayback: PlaybackSession?

    init(repository: HomeRepositoryProtocol? = nil) {
        self.repository = repository ?? MockHomeRepository()
    }

    func load() async {
        isLoading = true
        let feed = await repository.loadHomeFeed()
        featured = feed.featured
        channels = feed.channels
        contentRows = feed.contentRows
        isLoading = false
    }

    func selectChannel(_ channel: Channel) {
        let number = (channels.firstIndex(where: { $0.id == channel.id }) ?? 0) + 1
        activePlayback = .from(channel: channel, number: number)
    }

    func selectContent(_ item: ContentItem) {
        activePlayback = .from(content: item)
    }

    func playFeatured() {
        if let featured {
            // Khớp màn hình mẫu khi mở từ hero Thời sự 19h.
            if featured.id == MockHomeData.featured.id {
                activePlayback = .demoVTV1
            } else {
                activePlayback = .from(content: featured)
            }
        }
    }

    func dismissPlayer() {
        activePlayback = nil
    }
}

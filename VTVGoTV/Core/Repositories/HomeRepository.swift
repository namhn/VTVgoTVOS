//
//  HomeRepository.swift
//  VTVGoTV
//

import Foundation

struct HomeFeed {
    let featured: ContentItem
    let channels: [Channel]
    let contentRows: [ContentRow]
}

protocol HomeRepositoryProtocol {
    func loadHomeFeed() async -> HomeFeed
}

/// Repository mock — trả dữ liệu mẫu, chưa gọi API.
final class MockHomeRepository: HomeRepositoryProtocol {
    func loadHomeFeed() async -> HomeFeed {
        // Giả lập độ trễ nhẹ như khi tải dữ liệu.
        try? await Task.sleep(nanoseconds: 150_000_000)
        return HomeFeed(
            featured: MockHomeData.featured,
            channels: MockHomeData.channels,
            contentRows: MockHomeData.contentRows
        )
    }
}

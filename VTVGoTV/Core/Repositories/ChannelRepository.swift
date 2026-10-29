//
//  ChannelRepository.swift
//  VTVGoTV
//

import Foundation

protocol ChannelRepositoryProtocol {
    func fetchChannels() async throws -> [Channel]
}

/// Giai đoạn 1: dùng mock. APIClient giữ lại cho giai đoạn kết nối thật.
final class ChannelRepository: ChannelRepositoryProtocol {
    func fetchChannels() async throws -> [Channel] {
        MockHomeData.channels
    }
}

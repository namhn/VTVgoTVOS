//
//  MockHomeData.swift
//  VTVGoTV
//
//  Dữ liệu mẫu tách khỏi UI — chưa kết nối API thật.
//

import Foundation

enum MockHomeData {
    static let featured = ContentItem(
        id: "featured-1",
        title: "Thời sự 19h",
        subtitle: "Đang phát · VTV1",
        description: "Điểm tin nóng trong ngày, cập nhật chính trị, kinh tế và xã hội.",
        symbolName: "newspaper.fill",
        accentColorHex: 0xC8102E,
        isLive: true,
        durationLabel: "LIVE"
    )

    static let channels: [Channel] = [
        Channel(
            id: "vtv1",
            name: "VTV1",
            shortName: "VTV1",
            category: "Tin tức",
            isLive: true,
            symbolName: "1.circle.fill",
            brandColorHex: 0xC8102E,
            logoURL: nil,
            streamURL: nil
        ),
        Channel(
            id: "vtv2",
            name: "VTV2",
            shortName: "VTV2",
            category: "Khoa giáo",
            isLive: true,
            symbolName: "2.circle.fill",
            brandColorHex: 0x0B6E4F,
            logoURL: nil,
            streamURL: nil
        ),
        Channel(
            id: "vtv3",
            name: "VTV3",
            shortName: "VTV3",
            category: "Giải trí",
            isLive: true,
            symbolName: "3.circle.fill",
            brandColorHex: 0xF4A261,
            logoURL: nil,
            streamURL: nil
        ),
        Channel(
            id: "vtv4",
            name: "VTV4",
            shortName: "VTV4",
            category: "Quốc tế",
            isLive: true,
            symbolName: "4.circle.fill",
            brandColorHex: 0x2A9D8F,
            logoURL: nil,
            streamURL: nil
        ),
        Channel(
            id: "vtv5",
            name: "VTV5",
            shortName: "VTV5",
            category: "Dân tộc",
            isLive: false,
            symbolName: "5.circle.fill",
            brandColorHex: 0x457B9D,
            logoURL: nil,
            streamURL: nil
        ),
        Channel(
            id: "vtv6",
            name: "VTV6",
            shortName: "VTV6",
            category: "Thanh thiếu niên",
            isLive: true,
            symbolName: "6.circle.fill",
            brandColorHex: 0xE76F51,
            logoURL: nil,
            streamURL: nil
        ),
        Channel(
            id: "vtv7",
            name: "VTV7",
            shortName: "VTV7",
            category: "Giáo dục",
            isLive: true,
            symbolName: "7.circle.fill",
            brandColorHex: 0x264653,
            logoURL: nil,
            streamURL: nil
        ),
        Channel(
            id: "vtv8",
            name: "VTV8",
            shortName: "VTV8",
            category: "Khu vực",
            isLive: false,
            symbolName: "8.circle.fill",
            brandColorHex: 0x6D597A,
            logoURL: nil,
            streamURL: nil
        ),
        Channel(
            id: "vtv9",
            name: "VTV9",
            shortName: "VTV9",
            category: "Khu vực",
            isLive: true,
            symbolName: "9.circle.fill",
            brandColorHex: 0xB56576,
            logoURL: nil,
            streamURL: nil
        )
    ]

    static let contentRows: [ContentRow] = [
        ContentRow(
            id: "row-trending",
            title: "Đang thịnh hành",
            items: [
                ContentItem(
                    id: "c1",
                    title: "Cuộc đua kỳ thú",
                    subtitle: "Tập 8 · VTV3",
                    description: "Hành trình khám phá Việt Nam cùng các đội đua.",
                    symbolName: "flag.checkered",
                    accentColorHex: 0xE76F51,
                    isLive: false,
                    durationLabel: "45 phút"
                ),
                ContentItem(
                    id: "c2",
                    title: "Đường lên đỉnh Olympia",
                    subtitle: "Tuần 2 · Tháng 1",
                    description: "Sân chơi trí tuệ dành cho học sinh THPT.",
                    symbolName: "trophy.fill",
                    accentColorHex: 0xF4A261,
                    isLive: false,
                    durationLabel: "60 phút"
                ),
                ContentItem(
                    id: "c3",
                    title: "Chào buổi sáng",
                    subtitle: "Đang phát · VTV1",
                    description: "Tạp chí buổi sáng với tin tức và chuyện đời sống.",
                    symbolName: "sun.max.fill",
                    accentColorHex: 0xC8102E,
                    isLive: true,
                    durationLabel: "LIVE"
                ),
                ContentItem(
                    id: "c4",
                    title: "VTV Đặc biệt",
                    subtitle: "Phim tài liệu",
                    description: "Những câu chuyện sâu sắc về đất nước và con người.",
                    symbolName: "film.fill",
                    accentColorHex: 0x457B9D,
                    isLive: false,
                    durationLabel: "52 phút"
                ),
                ContentItem(
                    id: "c5",
                    title: "Thể thao 24h",
                    subtitle: "Tổng hợp trong ngày",
                    description: "Điểm lại các trận đấu và sự kiện thể thao nổi bật.",
                    symbolName: "sportscourt.fill",
                    accentColorHex: 0x0B6E4F,
                    isLive: false,
                    durationLabel: "30 phút"
                )
            ]
        ),
        ContentRow(
            id: "row-recommend",
            title: "Gợi ý cho bạn",
            items: [
                ContentItem(
                    id: "c6",
                    title: "Gặp nhau cuối tuần",
                    subtitle: "Hài kịch · VTV3",
                    description: "Chương trình giải trí cuối tuần quen thuộc.",
                    symbolName: "face.smiling.fill",
                    accentColorHex: 0xE9C46A,
                    isLive: false,
                    durationLabel: "90 phút"
                ),
                ContentItem(
                    id: "c7",
                    title: "Khoa học thường thức",
                    subtitle: "VTV2",
                    description: "Khám phá kiến thức khoa học gần gũi đời sống.",
                    symbolName: "atom",
                    accentColorHex: 0x2A9D8F,
                    isLive: false,
                    durationLabel: "25 phút"
                ),
                ContentItem(
                    id: "c8",
                    title: "Phim Việt giờ vàng",
                    subtitle: "Tập mới",
                    description: "Tình tiết hấp dẫn mỗi tối trên sóng VTV.",
                    symbolName: "tv.fill",
                    accentColorHex: 0xC8102E,
                    isLive: false,
                    durationLabel: "45 phút"
                ),
                ContentItem(
                    id: "c9",
                    title: "Âm nhạc và bạn",
                    subtitle: "VTV6",
                    description: "Không gian âm nhạc dành cho giới trẻ.",
                    symbolName: "music.note",
                    accentColorHex: 0x6D597A,
                    isLive: false,
                    durationLabel: "40 phút"
                )
            ]
        )
    ]
}

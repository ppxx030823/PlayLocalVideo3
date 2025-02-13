//
//  ViewModel.swift
//  PlayLocalVideo3
//
//  Created by ppx on 2025/2/12.
//

// VideoViewModel.swift
import UIKit
import AVFoundation

class VideoViewModel {
    // 存储视频数据
    var videos: [Video] = [
        Video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        Video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        Video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        Video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        Video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        Video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]

    // 获取分区数量
    func numberOfSections() -> Int {
        return 2
    }

    // 获取指定分区的行数
    func numberOfRows(in section: Int) -> Int {
        return videos.count
    }

    // 获取指定索引路径的视频数据
    func video(at indexPath: IndexPath) -> Video {
        return videos[indexPath.row]
    }

    // 根据视频信息创建 AVPlayer
    func playerForVideo(at indexPath: IndexPath) -> AVPlayer? {
        let video = videos[indexPath.row]
        // 这里假设视频文件名与截图名有对应关系，你可能需要根据实际情况修改
        _ = video.image.replacingOccurrences(of: "videoScreenshot", with: "video") + ".mp4"
        if let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4") {
            return AVPlayer(url: URL(fileURLWithPath: path))
        }
        return nil
    }
}

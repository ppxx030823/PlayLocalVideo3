//
//  ViewController.swift
//  PlayLocalVideo3
//
//  Created by ppx on 2025/2/12.
//

// ViewController.swift
import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // 视频表格视图
    private let videoTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(VideoCell.self, forCellReuseIdentifier: VideoCell.reuseIdentifier)
        return tableView
    }()

    // 视频视图模型
    private let viewModel = VideoViewModel()
    // 视频播放视图控制器
    private var playViewController = AVPlayerViewController()
    private var playerView = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureTableView()
    }

    // 设置用户界面
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(videoTableView)
        videoTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            videoTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            videoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            videoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            videoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // 配置表格视图
    private func configureTableView() {
        videoTableView.dataSource = self
        videoTableView.delegate = self
    }

    // MARK: - UITableViewDataSource 协议方法
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VideoCell.reuseIdentifier, for: indexPath) as! VideoCell
        let video = viewModel.video(at: indexPath)
        cell.configure(with: video)
        return cell
    }

    // MARK: - UITableViewDelegate 协议方法
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let player = viewModel.playerForVideo(at: indexPath) {
            playViewController.player = player
            present(playViewController, animated: true) {
                self.playViewController.player?.play()
            }
        } else {
            let alert = UIAlertController(title: "播放失败", message: "无法加载该视频，请稍后重试。", preferredStyle:.alert)
            let okAction = UIAlertAction(title: "确定", style:.default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }


}

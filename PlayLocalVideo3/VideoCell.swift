//
//  VideoCell.swift
//  PlayLocalVideo3
//
//  Created by ppx on 2025/2/13.
//

// VideoCell.swift
import UIKit
import SnapKit

class VideoCell: UITableViewCell {
    static let reuseIdentifier = "VideoCell"

    private let videoScreenshot: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let videoTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    private let videoSourceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with video: Video) {
        videoTitleLabel.text = video.title
        videoSourceLabel.text = video.source
        videoScreenshot.image = UIImage(named: video.image)
    }

    private func setupSubviews() {
        contentView.addSubview(videoScreenshot)
        contentView.addSubview(videoTitleLabel)
        contentView.addSubview(videoSourceLabel)
    }

    private func setupConstraints() {
        videoScreenshot.translatesAutoresizingMaskIntoConstraints = false
        videoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        videoSourceLabel.translatesAutoresizingMaskIntoConstraints = false

        videoScreenshot.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        videoTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(10)
//            make.width.equalTo(30)
        }

        videoSourceLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
//            make.width.equalTo(30)
        }

    }
}

//
//  VideoCell.swift
//  PlayLocalVideo3
//
//  Created by ppx on 2025/2/13.
//

// VideoCell.swift
import UIKit

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

        NSLayoutConstraint.activate([
            videoScreenshot.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            videoScreenshot.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            videoScreenshot.widthAnchor.constraint(equalToConstant: 80),
            videoScreenshot.heightAnchor.constraint(equalToConstant: 80),

            videoTitleLabel.leadingAnchor.constraint(equalTo: videoScreenshot.trailingAnchor, constant: 10),
            videoTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            videoTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

            videoSourceLabel.leadingAnchor.constraint(equalTo: videoScreenshot.trailingAnchor, constant: 10),
            videoSourceLabel.topAnchor.constraint(equalTo: videoTitleLabel.bottomAnchor, constant: 5),
            videoSourceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
}

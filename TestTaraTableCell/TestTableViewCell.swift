//
//  TestTableViewCell.swift
//  TestTaraTableCell
//
//  Created by Vladimir Djurdjevic on 5/11/23.
//

import UIKit

class TestTableViewCell: UITableViewCell {
        
    let nameLabel: UILabel = {
        var view = UILabel()
        view.text = "Nick Jonson"
        view.font = view.font.withSize(14)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        return view
    }()
    
    let dateLabel: UILabel = {
        var view = UILabel()
        view.text = "May 2, 2023"
        view.font = view.font.withSize(18)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .systemBlue
        return view
    }()
    
    let avatarImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "default-avatar")
        return image
    }()
    
    let lentaIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "closed-icon")
        return image
    }()
    
    let celebrationTypeIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "rings-icon")
        return image
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        layer.masksToBounds = false
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 0)

        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
                
    private func setupView() {
                
        addSubview(avatarImage)
        addSubview(nameLabel)
        addSubview(dateLabel)
        addSubview(celebrationTypeIcon)
        addSubview(lentaIcon)
        
        NSLayoutConstraint.activate([
            
            avatarImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            avatarImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImage.widthAnchor.constraint(equalToConstant: 50),
            avatarImage.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 10),
            
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 10),
            
            celebrationTypeIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            celebrationTypeIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            celebrationTypeIcon.widthAnchor.constraint(equalToConstant: 50),
            celebrationTypeIcon.heightAnchor.constraint(equalToConstant: 50),
            
            lentaIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            lentaIcon.topAnchor.constraint(equalTo: topAnchor, constant: -17),
            lentaIcon.widthAnchor.constraint(equalToConstant: 100),
            lentaIcon.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}

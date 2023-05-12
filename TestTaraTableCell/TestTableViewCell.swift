//
//  TestTableViewCell.swift
//  TestTaraTableCell
//
//  Created by Vladimir Djurdjevic on 5/11/23.
//

import UIKit

class TestTableViewCell: UITableViewCell {
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 5.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let collapseStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center
        view.spacing = 10.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let labelStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        view.textColor = UIColor(named: "blueColor")
        return view
    }()
    
    let avatarImage: UIImageView = {
        let image = UIImageView()
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
        selectionStyle = .none
        
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
        
        addSubview(stackView)
        
        stackView.addArrangedSubview(collapseStackView)
        collapseStackView.addArrangedSubview(avatarImage)
        
        labelStackView.addArrangedSubview(nameLabel)
        labelStackView.addArrangedSubview(dateLabel)
        collapseStackView.addArrangedSubview(labelStackView)
        collapseStackView.addArrangedSubview(celebrationTypeIcon)
                
        addSubview(lentaIcon)
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            avatarImage.widthAnchor.constraint(equalToConstant: 50),
            avatarImage.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 10),

            dateLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 10),

            celebrationTypeIcon.widthAnchor.constraint(equalToConstant: 50),
            celebrationTypeIcon.heightAnchor.constraint(equalToConstant: 50),
            
            lentaIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            lentaIcon.topAnchor.constraint(equalTo: topAnchor, constant: -17),
            lentaIcon.widthAnchor.constraint(equalToConstant: 100),
            lentaIcon.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}

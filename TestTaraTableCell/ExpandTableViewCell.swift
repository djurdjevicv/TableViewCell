//
//  ExpandTableViewCell.swift
//  TestTaraTableCell
//
//  Created by Vladimir Djurdjevic on 5/12/23.
//

import UIKit

class ExpandTableViewCell: TestTableViewCell {
    
    let lineView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(named: "blueColor")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let underLinestackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        view.isLayoutMarginsRelativeArrangement = true
        return view
    }()
    
    let peopleInfoLabel: UILabel = {
        var label = UILabel()
        label.text = "18 people are in the group."
        label.font = label.font.withSize(12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    private let buttonStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 5.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let visitProfileButton: UIButton = {
        var button = UIButton()
        button.backgroundColor =  UIColor(named: "blueColor")
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Visit profile", for: .normal)
        return button
    }()
    
    let openGroupButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = UIColor(named: "blueColor")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.setTitle("Open group", for: .normal)
        return button
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
                
    private func setupView() {
        
        stackView.addArrangedSubview(lineView)
        stackView.addArrangedSubview(underLinestackView)
        
        underLinestackView.addArrangedSubview(peopleInfoLabel)
        
        buttonStackView.addArrangedSubview(visitProfileButton)
        buttonStackView.addArrangedSubview(openGroupButton)
        
        underLinestackView.addArrangedSubview(buttonStackView)
                
        NSLayoutConstraint.activate([
            lineView.heightAnchor.constraint(equalToConstant: 1),
            
            visitProfileButton.heightAnchor.constraint(equalToConstant: 30),
            visitProfileButton.widthAnchor.constraint(equalToConstant: 120),
            
            visitProfileButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -5),
            
            openGroupButton.heightAnchor.constraint(equalToConstant: 30),
            openGroupButton.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
}

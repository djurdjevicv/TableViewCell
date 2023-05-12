//
//  ViewController.swift
//  TestTaraTableCell
//
//  Created by Vladimir Djurdjevic on 5/11/23.
//

import UIKit

class ViewController: UIViewController {

    private let tableView:  UITableView = {
        var tableView = UITableView()
        tableView.register(TestTableViewCell.self, forCellReuseIdentifier: "testCell")
        tableView.register(ExpandTableViewCell.self, forCellReuseIdentifier: "expandCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    fileprivate var expandedIndexSet = Set<IndexPath>()
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if expandedIndexSet.contains(indexPath) {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "expandCell", for: indexPath) as? ExpandTableViewCell {
                            
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath) as? TestTableViewCell {
                            
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
        let radius = cell.contentView.layer.cornerRadius
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: radius).cgPath
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if expandedIndexSet.contains(indexPath) {
            return 185.0;
        } else {
            return 100.0;
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if expandedIndexSet.contains(indexPath) {
            expandedIndexSet.remove(indexPath)
        } else {
            expandedIndexSet.insert(indexPath)
        }
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
}


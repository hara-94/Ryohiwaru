//
//  StartHeaderView.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/05.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Resource

final class StartHeaderView: UITableViewHeaderFooterView {

    var section: Int?
    var action: ((Int) -> ())?
    var gestureRecognizer: UITapGestureRecognizer?
    private let imageView: UIImageView = .init()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setRecognizer()
        setLooks()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setRecognizer()
        setLooks()
        setLayout()
    }
    
    private func setRecognizer() {
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleSelected(gestureRecognizer:)))
        addGestureRecognizer(gestureRecognizer!)
        gestureRecognizer?.delegate = self
    }
    
    private func setLooks() {
        makeEdgeCircle(radius: 15)
        self.contentView.backgroundColor = Color.Background.cellTitle
    }
    
    private func setLayout() {
        contentView.addSubview(imageView)
        
        imageView.image = UIImage(systemName: "arrowtriangle.down.fill")
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 12),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    
    func config(title: String ,section: Int, action: ((Int) -> ())?) {
        self.textLabel?.text = title
        self.section = section
        self.action = action
    }
    
    @objc private func handleSelected(gestureRecognizer: UITapGestureRecognizer) {
        guard let headerView = gestureRecognizer.view as? StartHeaderView,
            let section = headerView.section,
            let action = headerView.action else {
            return
        }
        action(section)
    }
}

extension StartHeaderView: UIGestureRecognizerDelegate { }

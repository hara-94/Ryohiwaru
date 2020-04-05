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
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setRecognizer()
        setLooks()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setRecognizer()
        setLooks()
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

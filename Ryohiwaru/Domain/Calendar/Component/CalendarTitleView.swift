//
//  CalendarTitleView.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/15.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Resource

final class CalendarTitleView: UIView {
    private let stackView: UIStackView = .init()
    private let nextButton: UIButton = .init()
    private let prevButton: UIButton = .init()
    private let titleLabel: UILabel = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setLayout() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(prevButton)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(nextButton)
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        nextButton.backgroundColor = Color.Background.buttonStart
        nextButton.makeEdgeCircle(radius: 20)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 60),
            nextButton.topAnchor.constraint(equalTo: stackView.topAnchor),
            nextButton.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            nextButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
        
        prevButton.setTitle("Prev", for: .normal)
        prevButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        prevButton.backgroundColor = Color.Background.buttonStart
        prevButton.makeEdgeCircle(radius: 20)
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            prevButton.widthAnchor.constraint(equalToConstant: 60),
            prevButton.topAnchor.constraint(equalTo: stackView.topAnchor),
            prevButton.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            prevButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
        ])
        
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: stackView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: prevButton.trailingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: nextButton.leadingAnchor),
        ])
    }
    enum Target {
        case prev
        case next
    }
    
    func setFuncButton(button: Target, target: Any, action: Selector, event: UIControl.Event) {
        switch button {
        case .prev:
            prevButton.addTarget(target, action: action, for: event)
        case .next:
            nextButton.addTarget(target, action: action, for: event)
        }
    }
    
    func setTitle(title: String) {
        titleLabel.text = title
    }
}

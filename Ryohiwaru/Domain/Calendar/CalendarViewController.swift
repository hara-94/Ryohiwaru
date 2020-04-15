//
//  CalendarViewController.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/12.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Wireframe
import Resource
import Infra

final class CalendarViewController: CalendarBaseView<CalendarDependency> {
    private var cal = Calendar.current
    private let dateFormatter = DateFormatter()
    private var components = DateComponents()
    private let now = Date()
    private let dateManager: MonthDateManager = .init()
    private let weeks = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    private let weekView: CalendarWeekView = .init()
    private let titleView: CalendarTitleView = .init()
    private let nextButton: UIButton = .init()
    private let prevButton: UIButton = .init()
    private let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = .init()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 70, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), collectionViewLayout: layout)
        collectionView.backgroundColor = Color.Background.main
        collectionView.register(CalendarCell.self, forCellWithReuseIdentifier: "CalendarCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        cal.locale = Locale(identifier: "ja")
        dateFormatter.locale = Locale(identifier: "ja_JP")
        components.year = cal.component(.year, from: now)
        components.month = cal.component(.month, from: now)
        components.day = 1
        setTitleView()
        setWeekView()
    }
}

extension CalendarViewController: UICollectionViewDelegate {
    
}

extension CalendarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 37
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        let firstDayOfMonth = cal.date(from: components)
        let firstWeekDay = cal.component(.weekday, from: firstDayOfMonth!)
        let weekDayAdding = 2 - firstWeekDay
        let daysCountInMonth = cal.range(of: .day, in: .month, for: firstDayOfMonth!)?.count
        
        if indexPath.row + weekDayAdding >= 1 && indexPath.row + weekDayAdding <= daysCountInMonth! {
            cell.setText(text: "\(indexPath.row + weekDayAdding)")
            cell.backgroundColor = .white
        }
        return cell
    }
}

extension CalendarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (view.frame.width - 32) / 7
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}

private extension CalendarViewController {
    func setTitleView() {
        view.addSubview(titleView)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32),
            titleView.heightAnchor.constraint(equalToConstant: 40),
            titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleView.topAnchor.constraint(equalTo: view.topAnchor),
        ])
    }
    
    func setWeekView() {
        view.addSubview(weekView)
        weekView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weekView.widthAnchor.constraint(equalTo: view.widthAnchor),
            weekView.heightAnchor.constraint(equalToConstant: 30),
            weekView.topAnchor.constraint(equalTo: titleView.bottomAnchor),
        ])
    }
}

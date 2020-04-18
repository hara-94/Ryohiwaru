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
    private let dateManager: MonthDateManager = .init()
    private let weeks = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    private let weekView: CalendarWeekView = .init()
    private let titleView: CalendarTitleView = .init()
    private let nextButton: UIButton = .init()
    private let prevButton: UIButton = .init()
    private var month = Calendar.current.component(.month, from: Date())
    private let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = .init()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 75, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), collectionViewLayout: layout)
        collectionView.backgroundColor = Color.Background.main
        collectionView.register(CalendarCell.self, forCellWithReuseIdentifier: "CalendarCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        setTitleView()
        setWeekView()
    }
}

extension CalendarViewController: UICollectionViewDelegate { }

extension CalendarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dateManager.days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        let date = dateManager.days[indexPath.row]
        let month = Calendar.current.component(.month, from: date)
        if month == self.month {
            cell.configure(date: dateManager.days[indexPath.row])
        }  else {
            cell.initialize()
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
    @objc func toPrevMonth(_ sender: Any?) {
        dateManager.prevMonth()
        titleView.setTitle(title: dateManager.monthString)
        month = month == 1 ? 12 : month - 1
        collectionView.reloadData()
    }
    
    @objc func toNextMonth(_ sender: Any?) {
        dateManager.nextMonth()
        titleView.setTitle(title: dateManager.monthString)
        month = month == 12 ? 1 : month + 1
        collectionView.reloadData()
    }
    
    func setTitleView() {
        view.addSubview(titleView)
        titleView.setTitle(title: dateManager.monthString)
        titleView.setFuncButton(button: .prev, target: self, action: #selector(toPrevMonth(_:)), event: .touchUpInside)
        titleView.setFuncButton(button: .next, target: self, action: #selector(toNextMonth(_:)), event: .touchUpInside)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32),
            titleView.heightAnchor.constraint(equalToConstant: 40),
            titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
        ])
    }
    
    func setWeekView() {
        view.addSubview(weekView)
        weekView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weekView.widthAnchor.constraint(equalTo: view.widthAnchor),
            weekView.heightAnchor.constraint(equalToConstant: 20),
            weekView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 5),
        ])
    }
    
    func setMonthTitle() {
        
    }
}

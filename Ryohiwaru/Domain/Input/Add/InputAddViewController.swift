//
//  InputAddViewController.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/11.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Wireframe
import Resource

final class InputAddViewController: InputAddBaseView<InputAddDepedency> {
    private let dateView: InputAddColumnView = .init(type: .date, title: "日付")
    private let memoView: InputAddColumnView = .init(type: .memo, title: "メモ")
    private let paymentView: InputAddColumnView = .init(type: .input, title: "金額")
    private var date: Date = .init()
    private var selectedIdx: Int = 0
    private let registerButton: UIButton = .init()
    private let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = .init()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(InputAddCategoryCell.self, forCellWithReuseIdentifier: "InputAddCategoryCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setColumnView()
        setButton()
        setCollectionView()
    }
    
    override func update(viewModel: ViewModel?) {
        super.update(viewModel: viewModel)
    }
}

extension InputAddViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewModel = self.viewModel else { fatalError("ViewModel is not defined successfully") }
        if !viewModel.categories[indexPath.row].isSelected {
            selectedIdx = indexPath.row
            collectionView.reloadData()
        }
    }
}

extension InputAddViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = self.viewModel else {
            fatalError("ViewModel is not defined successfully")
        }
        return viewModel.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InputAddCategoryCell", for: indexPath) as? InputAddCategoryCell else {
            fatalError("Cell is not defined successfully")
        }
        guard let viewModel = self.viewModel else {
            fatalError("ViewModel is not defined successfully")
        }
        cell.configure(item: viewModel.categories[indexPath.item])
        print(selectedIdx)
        if indexPath.row == selectedIdx {
            cell.selected()
        } else {
            cell.unselected()
        }
        return cell
    }
}

extension InputAddViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width - 32) / 3
        return CGSize(width: size, height: size)
    }
}

private extension InputAddViewController {
    func setColumnView() {
        view.addSubview(dateView)
        view.addSubview(memoView)
        view.addSubview(paymentView)
        
        dateView.setButtonFunc(for: .prev, target: self, action: #selector(toPrevDay(_:)), event: .touchUpInside)
        dateView.setButtonFunc(for: .next, target: self, action: #selector(toNextDay(_:)), event: .touchUpInside)
        dateView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateView.heightAnchor.constraint(equalToConstant: 40),
            dateView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            dateView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dateView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        memoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            memoView.heightAnchor.constraint(equalToConstant: 40),
            memoView.topAnchor.constraint(equalTo: dateView.bottomAnchor, constant: 10),
            memoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            memoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        paymentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            paymentView.heightAnchor.constraint(equalToConstant: 40),
            paymentView.topAnchor.constraint(equalTo: memoView.bottomAnchor, constant: 10),
            paymentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            paymentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func setButton() {
        view.addSubview(registerButton)
        registerButton.makeEdgeCircle(radius: 20)
        registerButton.backgroundColor = Color.Background.buttonStart
        registerButton.setTitle("入力", for: .normal)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            registerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
        ])
    }
    
    func setCollectionView() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.topAnchor.constraint(equalTo: paymentView.bottomAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -20),
        ])
    }
    
    @objc func toPrevDay(_ sender: Any?) {
        let cal = Calendar.current
        date = cal.date(byAdding: .day, value: -1, to: date)!
        dateView.setDateInTextField(date: date)
    }
    
    @objc func toNextDay(_ sender: Any?) {
        let cal = Calendar.current
        date = cal.date(byAdding: .day, value: 1, to: date)!
        dateView.setDateInTextField(date: date)
    }
}

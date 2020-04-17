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
    private let dateView: InputAddColumnView = .init(type: .date)
    private let memoView: InputAddColumnView = .init(type: .memo)
    private let paymentView: InputAddColumnView = .init(type: .input)
    private let registerButton: UIButton = .init()
    private let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = .init()
        layout.scrollDirection = .vertical
        let collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
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

extension InputAddViewController: UICollectionViewDelegate {}

extension InputAddViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue
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
}

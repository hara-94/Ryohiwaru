//
//  InputAddViewController.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/11.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Wireframe

final class InputAddViewController: InputAddBaseView<InputAddDepedency> {
    private let dateView: InputAddColumnView = .init(type: .date)
    private let memoView: InputAddColumnView = .init(type: .memo)
    private let paymentView: InputAddColumnView = .init(type: .input)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setColumnView()
    }
    
    override func update(viewModel: ViewModel?) {
        super.update(viewModel: viewModel)
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
}

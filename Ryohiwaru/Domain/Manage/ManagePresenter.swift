//
//  ManagePresenter.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/07.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Wireframe
import Infra

final class ManagePresenter: ManageBasePresenter<ManageDepedency> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewModel = ManageViewModel(travels: [
            .init(title: "001", startDate: "00/00", endDate: "00/00", allPayments: 15000),
            .init(title: "002", startDate: "00/00", endDate: "00/00", allPayments: 15000),
            .init(title: "003", startDate: "00/00", endDate: "00/00", allPayments: 15000),
            .init(title: "004", startDate: "00/00", endDate: "00/00", allPayments: 15000),
            .init(title: "005", startDate: "00/00", endDate: "00/00", allPayments: 15000),
        ])
        update(viewModel: viewModel)
    }
    
    override func on(event: ManagePresenterOperation) {
        switch event {
        case let .onTapCell(index):
            let viewController = DetailRouter.assemble()
            let inputViewController = InputRouter.assemble()
            inputViewController.tabBarItem = UITabBarItem(title: "入力", image: UIImage(named: "input"), tag: 1)
            let calendarViewController = CalendarRouter.assemble()
            calendarViewController.tabBarItem = UITabBarItem(title: "カレンダー", image: UIImage(named: "calendar"), tag: 2)
            viewController.setViewControllers([inputViewController, calendarViewController], animated: true)
            if let view = view as? ManageViewController {
                view.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
}

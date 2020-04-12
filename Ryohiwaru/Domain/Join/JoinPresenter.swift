//
//  JoinPresenter.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/07.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Wireframe

final class JoinPresenter: JoinBasePresenter<JoinDependency> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func on(event: JoinPresenterOperation) {
        switch event {
        case let .onTapSubmit(id):
            print("\(id) is passed")
            let viewController = DetailRouter.assemble()
            let inputViewController = InputRouter.assemble()
            inputViewController.tabBarItem = UITabBarItem(title: "入力", image: UIImage(named: "input"), tag: 1)
            let calendarViewController = CalendarRouter.assemble()
            calendarViewController.tabBarItem = UITabBarItem(title: "カレンダー", image: UIImage(named: "calendar"), tag: 2)
            viewController.setViewControllers([inputViewController, calendarViewController], animated: true)
            if let view = view as? JoinViewController {
                view.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
}

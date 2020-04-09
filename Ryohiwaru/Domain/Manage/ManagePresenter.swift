//
//  ManagePresenter.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/07.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Wireframe

final class ManagePresenter: ManageBasePresenter<ManageDepedency> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func on(event: ManagePresenterOperation) {
        switch event {
        case let .onTapCell(index):
            print("\(index) is passed")
            let viewController = DetailRouter.assemble()
            let inputViewController = InputRouter.assemble()
            inputViewController.tabBarItem = UITabBarItem(title: "入力", image: UIImage(named: "input"), tag: 1)
            viewController.setViewControllers([inputViewController], animated: true)
            if let view = view as? ManageViewController {
                view.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
}

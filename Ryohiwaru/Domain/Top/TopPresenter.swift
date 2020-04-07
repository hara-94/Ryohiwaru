//
//  TopPresenter.swift
//  Ryohiwaru
//
//  Created by 原ひかる on 2020/04/01.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Base
import Wireframe

final class TopPresenter: TopBasePresenter<TopDependency> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func on(event: TopPresenterOperation) {
        switch event {
        case .onTapManageButton:
            let viewController = ManageRouter.assemble()
            let navigationController = UINavigationController(rootViewController: viewController)
            if let view = self.view as? TopViewController {
                navigationController.modalPresentationStyle = .fullScreen
                view.present(navigationController, animated: true, completion: nil)
            }
        case .onTapJoinButton:
            print("onTapJoinButton")
        case .onTapStartButton:
            let viewController = StartRouter.assemble()
            if let view = self.view as? TopViewController {
                viewController.modalPresentationStyle = .pageSheet
                view.present(viewController, animated: true, completion: nil)
            }
        }
    }
}

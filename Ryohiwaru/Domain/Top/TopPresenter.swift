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
            if let view = self.view as? TopViewController {
                view.navigationController?.pushViewController(viewController, animated: true)
            }
        case .onTapJoinButton:
            let viewController = JoinRouter.assemble()
            if let view = self.view as? TopViewController {
                viewController.modalPresentationStyle = .pageSheet
                view.present(viewController, animated: true, completion: nil)
            }
        case .onTapStartButton:
            let viewController = StartRouter.assemble()
            if let view = self.view as? TopViewController {
                viewController.modalPresentationStyle = .pageSheet
                view.present(viewController, animated: true, completion: nil)
            }
        }
    }
}

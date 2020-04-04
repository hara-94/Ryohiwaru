//
//  TopPresenter.swift
//  Ryohiwaru
//
//  Created by 原ひかる on 2020/04/01.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Base
import Wireframe

final class TopPresenter: TopBasePresenter<TopDependency> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func on(event: TopPresenterOperation) {
        switch event {
        case .onTapManageButton:
            print("onTapManageButton")
        case .onTapJoinButton:
            print("onTapJoinButton")
        case .onTapStartButton:
            print("onTapStartButton")
        }
    }
}

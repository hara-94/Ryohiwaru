//
//  InputPresenter.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/09.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Wireframe
import Infra

final class InputPresenter: InputBasePresenter<InputDependency> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func on(event: InputPresenterOperation) {
        switch event {
        case let .onTapCell(item):
            print("\(item.category), \(item.money), \(item.name)")
        case .onTapFloatButton:
            print("onTapFloatButton")
        }
    }
}

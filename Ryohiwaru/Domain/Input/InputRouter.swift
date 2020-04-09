//
//  InputRouter.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/09.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Wireframe

final class InputRouter: InputBaseRouter<InputDependency> {
    override class func resolvePresenter() -> Presenter {
        return Presenter()
    }
}

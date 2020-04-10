//
//  InputAddRouter.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/11.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Wireframe

final class InputAddRouter: InputAddBaseRouter<InputAddDepedency> {
    override class func resolvePresenter() -> Presenter {
        return Presenter()
    }
}

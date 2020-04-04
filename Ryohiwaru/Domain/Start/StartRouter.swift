//
//  StartRouter.swift
//  Ryohiwaru
//
//  Created by 原ひかる on 2020/04/03.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Wireframe

final class StartRouter: StartBaseRouter<StartDepedency> {
    override class func resolvePresenter() -> StartPresenter {
        return Presenter()
    }
}

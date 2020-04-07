//
//  ManageRouter.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/07.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Wireframe

final class ManageRouter: ManageBaseRouter<ManageDepedency> {
    override class func resolvePresenter() -> ManagePresenter {
        return Presenter()
    }
}

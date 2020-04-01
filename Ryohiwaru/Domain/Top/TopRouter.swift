//
//  TopRouter.swift
//  Ryohiwaru
//
//  Created by 原ひかる on 2020/04/01.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Wireframe

final class TopRouter: TopBaseRouter<TopDependency> {
    override class func resolvePresenter() -> TopPresenter {
        return TopPresenter() 
    }
}

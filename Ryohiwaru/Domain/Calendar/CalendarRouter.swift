//
//  CalendarRouter.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/12.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Wireframe

final class CalendarRouter: CalendarBaseRouter<CalendarDependency> {
    override class func resolvePresenter() -> Presenter {
        return Presenter()
    }
}

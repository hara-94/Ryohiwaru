//
//  StartPresenter.swift
//  Ryohiwaru
//
//  Created by 原ひかる on 2020/04/03.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import Foundation
import Base
import Wireframe

final class StartPresenter: StartBasePresenter<StartDepedency> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleSection = StartViewModel.Section(title: "title", values: ["textfield"], expanded: false, cellType: .defaultCell)
        let dateSection = StartViewModel.Section(title: "date", values: ["textfield"], expanded: false, cellType: .date)
        let placeSection = StartViewModel.Section(title: "place", values: ["textfield"], expanded: false, cellType: .defaultCell)
        let sections = [titleSection, dateSection, placeSection]
        
        let viewModel = StartViewModel(sections: sections)
        self.update(viewModel: viewModel)
    }
    
    override func on(event: StartPresenterOperation) {
        switch event {
        case .onTapHeader:
            print("onTapHeader")
        case .onTapRegisterButton:
            print("onTapRegisterButton")
        }
    }
}

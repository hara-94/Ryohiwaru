//
//  InputAddPresenter.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/11.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Wireframe

final class InputAddPresenter: InputAddBasePresenter<InputAddDepedency> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewModel = InputAddViewModel(categories: [
            .init(icon: UIImage(named: "food")!, title: "食費", isSelected: false),
            .init(icon: UIImage(named: "train")!, title: "交通費", isSelected: false),
            .init(icon: UIImage(named: "hotel")!, title: "宿泊費", isSelected: false),
            .init(icon: UIImage(named: "sight")!, title: "観光", isSelected: false),
            .init(icon: UIImage(named: "activity")!, title: "アクティビティ", isSelected: false),
            .init(icon: UIImage(named: "else")!, title: "その他", isSelected: false),
        ])
        
        self.update(viewModel: viewModel)
    }
    
    override func on(event: InputAddPresenterOperation) {
        
    }
}

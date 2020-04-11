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
        
        let payments = inputInteractor.getPayments()
        let viewModel = InputViewModel(payments: payments)
        update(viewModel: viewModel)
    }
    
    override func resolveInputInteractor() -> InputDemoInteractor {
        return InputDemoInteractor()
    }
    
    override func on(event: InputPresenterOperation) {
        switch event {
        case let .onTapCell(payment):
            print("\(payment.category), \(payment.money), \(payment.name)")
        case .onTapFloatButton:
            let viewController = InputAddRouter.assemble()
            if let view = view as? InputViewController {
                viewController.modalPresentationStyle = .pageSheet
                view.present(viewController, animated: true, completion: nil)
            }
        }
    }
}

//
//  ITCHInfoAssembly.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit

final class ITCHInfoAssembly {
    static func build(with model: ITCHInfoModel) -> UIViewController {
        let presenter = ITCHInfoPresenter()
        let interactor = ITCHInfoInteractor(presenter: presenter, model: model)
        let view = ITCHInfoViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}

//
//  ColorDetailRouter.swift
//  Swift-VIPER
//
//  Created by Yuni Huang on 2019/1/4.
//  Copyright © 2019 Yuni Huang. All rights reserved.
//

import UIKit
import Foundation

class ColorDetailRouter: ColorDetailPresenterToRouterProtocol {
    static func createColorDetailModule(colorDetailRef: ColorDetailView, colorDetail: Color) {
        let presenter = ColorDetailPresenter()
        presenter.color = colorDetail
        colorDetailRef.presenter = presenter
        colorDetailRef.presenter?.view = colorDetailRef
        colorDetailRef.presenter?.router = ColorDetailRouter()
    }
    
    func backToPreviousPage(currentView: UIViewController) {
        currentView.navigationController?.popViewController(animated: true)
    }
}

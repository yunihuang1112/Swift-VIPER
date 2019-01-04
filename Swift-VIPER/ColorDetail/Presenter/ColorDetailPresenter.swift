//
//  ColorDetailPresenter.swift
//  Swift-VIPER
//
//  Created by Yuni Huang on 2019/1/4.
//  Copyright © 2019 Yuni Huang. All rights reserved.
//

import UIKit
import Foundation

class ColorDetailPresenter: ColorDetailViewToPresenterProtocol {
    var view: ColorDetailPresenterToViewProtocol?
    var router: ColorDetailPresenterToRouterProtocol?
    var color: Color?
    
    func loadDetail() {
        view?.showDetail(color: color!)
    }
    
    func backToPreviousView(currentView: UIViewController) {
        router?.backToPreviousPage(currentView: currentView)
    }
}

//
//  ColorDetailProtocols.swift
//  Swift-VIPER
//
//  Created by Yuni Huang on 2019/1/4.
//  Copyright © 2019 Yuni Huang. All rights reserved.
//

import UIKit
import Foundation

protocol ColorDetailViewToPresenterProtocol: class {
    var view: ColorDetailPresenterToViewProtocol? {get set}
    var router: ColorDetailPresenterToRouterProtocol? {get set}
    
    func loadDetail()
    func backToPreviousView(currentView: UIViewController)
}

protocol ColorDetailPresenterToViewProtocol: class {
    func showDetail(color: Color)
}

protocol ColorDetailPresenterToRouterProtocol: class {
    static func createColorDetailModule(colorDetailRef: ColorDetailView, colorDetail: Color)
    func backToPreviousPage(currentView: UIViewController)
}

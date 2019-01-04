//
//  ColorListRouter.swift
//  Swift-VIPER
//
//  Created by Yuni Huang on 2019/1/4.
//  Copyright © 2019 Yuni Huang. All rights reserved.
//

import UIKit
import Foundation

class ColorListRouter: ColorListPresenterToRouterProtocol {
    static func createColorListModule(colorListRef: ColorListView) {
        let presenter: ColorListViewToPresenterProtocol & ColorListInteractorToPresenterProtocol = ColorListPresenter()
        colorListRef.presenter = presenter
        colorListRef.presenter?.router = ColorListRouter()
        colorListRef.presenter?.view = colorListRef
        colorListRef.presenter?.interactor = ColorListInteractor()
        colorListRef.presenter?.interactor?.presenter = presenter
    }
    
    func pushToColorDetail(color: Color, fromView: UIViewController) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ColorDetailView") as! ColorDetailView
        ColorDetailRouter.createColorDetailModule(colorDetailRef: vc, colorDetail: color)
        fromView.navigationController?.pushViewController(vc, animated: true)
    }
}

//
//  ColorListPresenter.swift
//  Swift-VIPER
//
//  Created by Yuni Huang on 2019/1/4.
//  Copyright © 2019 Yuni Huang. All rights reserved.
//

import UIKit

class ColorListPresenter: ColorListViewToPresenterProtocol {
    var view: ColorListPresenterToViewProtocol?
    var interactor: ColorListPresenterToInteractorProtocol?
    var router: ColorListPresenterToRouterProtocol?
    var presenter: ColorListViewToPresenterProtocol?
    
    func loadColorList() {
        interactor?.getColorList()
    }
    
    func showColorDetail(color: Color, fromView: UIViewController) {
        router?.pushToColorDetail(color: color, fromView: fromView)
    }
}

extension ColorListPresenter: ColorListInteractorToPresenterProtocol {
    func fetchColorList(colorList: [Color]) {
        view?.showColors(colors: colorList)
    }
}

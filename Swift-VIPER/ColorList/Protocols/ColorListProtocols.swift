//
//  ColorListProtocols.swift
//  Swift-VIPER
//
//  Created by Yuni Huang on 2019/1/4.
//  Copyright © 2019 Yuni Huang. All rights reserved.
//

import UIKit

protocol ColorListViewToPresenterProtocol: class {
    var view: ColorListPresenterToViewProtocol? {get set}
    var interactor: ColorListPresenterToInteractorProtocol? {get set}
    var router: ColorListPresenterToRouterProtocol? {get set}
    
    func loadColorList()
    func showColorDetail(color: Color, fromView: UIViewController)
}

protocol ColorListPresenterToViewProtocol: class {
    func showColors(colors: [Color])
}

protocol ColorListPresenterToInteractorProtocol: class {
    var presenter: ColorListInteractorToPresenterProtocol? {get set}
    
    func getColorList()
}

protocol ColorListInteractorToPresenterProtocol: class {
    func fetchColorList(colorList: [Color])
}

protocol ColorListPresenterToRouterProtocol: class {
    static func createColorListModule(colorListRef: ColorListView)
    func pushToColorDetail(color: Color,fromView: UIViewController)
}

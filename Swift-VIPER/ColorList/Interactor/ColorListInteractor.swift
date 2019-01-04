//
//  ColorListInteractor.swift
//  Swift-VIPER
//
//  Created by Yuni Huang on 2019/1/4.
//  Copyright © 2019 Yuni Huang. All rights reserved.
//

import Foundation

class ColorListInteractor: ColorListPresenterToInteractorProtocol {
    var presenter: ColorListInteractorToPresenterProtocol?
    
    func getColorList() {
        presenter?.fetchColorList(colorList: getAllColorsForJson())
    }
    
    private func getAllColorsForJson() -> [Color] {
        var colorList = [Color]()
        if let path = Bundle.main.path(forResource: "color", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let json = try decoder.decode(JsonData.self, from: data)
                colorList = json.results
            } catch {
                print("error: from getAllColorsForJson.")
            }
        }
        return colorList
    }
}

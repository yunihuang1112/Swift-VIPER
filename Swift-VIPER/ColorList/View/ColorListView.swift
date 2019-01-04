//
//  ColorListView.swift
//  Swift-VIPER
//
//  Created by Yuni Huang on 2019/1/4.
//  Copyright © 2019 Yuni Huang. All rights reserved.
//

import UIKit

class ColorListView: UIViewController, ColorListPresenterToViewProtocol {
    
    @IBOutlet var colorsTableView: UITableView!
    
    var presenter: ColorListViewToPresenterProtocol?
    var colorList = [Color]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ColorListRouter.createColorListModule(colorListRef: self)
        presenter?.loadColorList()
        
        self.navigationController?.isNavigationBarHidden = true
        colorsTableView.delegate = self
        colorsTableView.dataSource = self
    }

    func showColors(colors: [Color]) {
        colorList = colors
        colorsTableView.reloadData()
    }
}

extension ColorListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = colorsTableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath) as! ColorCell
        let color = colorList[indexPath.row]
        cell.initCell(color: color)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showColorDetail(color: colorList[indexPath.row], fromView: self)
    }
}

class ColorCell: UITableViewCell {
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func initCell(color: Color) {
        let bgColor: UIColor = UIColor(red: CGFloat(color.r/255.0),
                                       green: CGFloat(color.g/255.0),
                                       blue: CGFloat(color.b/255.0),
                                       alpha: 1.0)
        nameLabel.text = color.name
        backView.backgroundColor = bgColor
    }
}

//
//  ColorDetailView.swift
//  Swift-VIPER
//
//  Created by Yuni Huang on 2019/1/4.
//  Copyright © 2019 Yuni Huang. All rights reserved.
//

import UIKit

class ColorDetailView: UIViewController, ColorDetailPresenterToViewProtocol {

    @IBOutlet weak var colorImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    var presenter: ColorDetailViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        colorImgView.layer.cornerRadius = 10.0
        colorImgView.layer.borderWidth = 2.0
        colorImgView.layer.borderColor = UIColor.white.cgColor
        presenter?.loadDetail()
    }
    
    func showDetail(color: Color) {
        let r: Float = color.r
        let g: Float = color.g
        let b: Float = color.b
        colorImgView.backgroundColor = UIColor(red: CGFloat(r/255.0),
                                               green: CGFloat(g/255.0),
                                               blue: CGFloat(b/255.0),
                                               alpha: 1.0)
        nameLabel.text = color.name
        descLabel.text = String.init(format: "%@\n\nHex: %@\n\nR :%.0f\nG: %.0f\nB: %.0f", color.desc, color.hex, r, g, b)
    }
    @IBAction func backPressed(_ sender: Any) {
        presenter?.backToPreviousView(currentView: self)
    }
}

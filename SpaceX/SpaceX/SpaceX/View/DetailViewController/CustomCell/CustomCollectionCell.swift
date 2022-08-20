//
//  CustomCollectionCell.swift
//  SpaceX
//
//  Created by Шермат Эшеров on 20/8/22.
//

import Foundation
import UIKit
import SnapKit

class CustomCollectionCell: UICollectionViewCell{
    
    static let identifier = "CustomCell"
    
    private lazy var infrom: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "229.6"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var infromlabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 142/255, green: 142/255, blue: 143/255, alpha: 1)
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.text = "Высота, ft"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    func setupUI(){
        contentView.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
        contentView.layer.cornerRadius = 32
        
        contentView.addSubview(infrom)
        infrom.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(28)
            make.width.equalTo(80)
        }
        
        contentView.addSubview(infromlabel)
        infromlabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(infrom.snp.bottom)
            make.width.equalTo(80)
        }
    }
    
    func fetchData(infrom: String, infromlabel: String){
        self.infrom.text = infrom
        self.infromlabel.text = infromlabel
    }
}

//
//  TableCell.swift
//  SpaceX
//
//  Created by Шермат Эшеров on 19/8/22.
//

import Foundation
import UIKit


class CustomTableCell: UITableViewCell{
    
    static let identifier = "CustomCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    func setupUI(){
        contentView.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
    }
    
}

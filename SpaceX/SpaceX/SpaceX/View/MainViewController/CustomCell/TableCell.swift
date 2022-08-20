//
//  TableCell.swift
//  SpaceX
//
//  Created by Шермат Эшеров on 19/8/22.
//

import Foundation
import UIKit
import SnapKit


class CustomTableCell: UITableViewCell{
    
    static let identifier = "CustomCell"
    
    private lazy var parenView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
        view.layer.cornerRadius = 24
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 142/255, green: 142/255, blue: 143/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private lazy var globusImage: UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage(systemName: "globe.americas.fill")
        imageV.tintColor = .white
        return imageV
    }()
    
    private lazy var ticketImage: UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage(named: "Success")
        return imageV
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    func setupUI(){
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
        contentView.addSubview(parenView)
        parenView.snp.makeConstraints { make in
            make.leading.equalTo(32)
            make.trailing.equalTo(-32)
            make.top.bottom.equalToSuperview()
        }
        
        parenView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(24)
            make.top.equalTo(24)
        }
        
        parenView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(24)
            make.top.equalTo(titleLabel.snp.bottom)
        }
        
        parenView.addSubview(globusImage)
        globusImage.snp.makeConstraints { make in
            make.trailing.equalTo(-33)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30)
        }
        
        globusImage.addSubview(ticketImage)
        ticketImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalTo(15)
            make.width.height.equalTo(15)
        }
    }
    
    func fetchData(title: String, date: String, active: Bool){
        titleLabel.text = title
        dateLabel.text = date
        if !active{
            ticketImage.image = UIImage(named: "Failed")
        }
    }
}

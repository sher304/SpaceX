//
//  SettingsViewController.swift
//  SpaceX
//
//  Created by Шермат Эшеров on 20/8/22.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {
    
    private lazy var settingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Настройки"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.text = "Высота"
        label.textColor = .white
        return label
    }()
    
    private lazy var diameterLabel: UILabel = {
        let label = UILabel()
        label.text = "Диаметр"
        label.textColor = .white
        return label
    }()
    
    private lazy var massLabel: UILabel = {
        let label = UILabel()
        label.text = "Масса"
        label.textColor = .white
        return label
    }()
    
    private lazy var powerLabel: UILabel = {
        let label = UILabel()
        label.text = "Полезная нагрузка"
        label.textColor = .white
        return label
    }()
    
    private lazy var heightView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
        view.layer.cornerRadius = 7.8
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var metterHeightButton: UIButton = {
        let button = UIButton()
        button.setTitle("m", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 7.8
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(heightMeterTappet), for: .touchUpInside)
        return button
    }()
    
    private lazy var ftHeightButton: UIButton = {
        let button = UIButton()
        button.setTitle("ft", for: .normal)
        button.layer.cornerRadius = 7.8
        button.layer.masksToBounds = true
        return button
    }()
    
    private lazy var diameterView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
        view.layer.cornerRadius = 7.8
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var metterDiameterButton: UIButton = {
        let button = UIButton()
        button.setTitle("m", for: .normal)
        button.layer.cornerRadius = 7.8
        button.layer.masksToBounds = true
        return button
    }()
    
    private lazy var ftDiameterButton: UIButton = {
        let button = UIButton()
        button.setTitle("ft", for: .normal)
        button.layer.cornerRadius = 7.8
        button.layer.masksToBounds = true
        return button
    }()
    
    private lazy var massView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
        view.layer.cornerRadius = 7.8
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var kilogramMassButton: UIButton = {
        let button = UIButton()
        button.setTitle("m", for: .normal)
        button.layer.cornerRadius = 7.8
        button.layer.masksToBounds = true
        return button
    }()
    
    private lazy var ibMassButton: UIButton = {
        let button = UIButton()
        button.setTitle("ft", for: .normal)
        button.layer.cornerRadius = 7.8
        button.layer.masksToBounds = true
        return button
    }()
    
    private lazy var powerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
        view.layer.cornerRadius = 7.8
        view.layer.masksToBounds = true

        return view
    }()
    
    private lazy var kilogramPowerButton: UIButton = {
        let button = UIButton()
        button.setTitle("m", for: .normal)
        button.layer.cornerRadius = 7.8
        button.layer.masksToBounds = true
        return button
    }()
    
    private lazy var ibPowerButton: UIButton = {
        let button = UIButton()
        button.setTitle("ft", for: .normal)
        button.layer.cornerRadius = 7.8
        button.layer.masksToBounds = true
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    func setupUI(){
        view.backgroundColor = .black
        
        view.addSubview(settingsLabel)
        settingsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(50)
        }
        
        view.addSubview(heightLabel)
        heightLabel.snp.makeConstraints { make in
            make.leading.equalTo(28)
            make.top.equalTo(120)
        }
        
        view.addSubview(diameterLabel)
        diameterLabel.snp.makeConstraints { make in
            make.leading.equalTo(28)
            make.top.equalTo(heightLabel.snp.bottom).offset(40)
        }
        view.addSubview(massLabel)
        massLabel.snp.makeConstraints { make in
            make.leading.equalTo(28)
            make.top.equalTo(diameterLabel.snp.bottom).offset(40)
        }
        
        view.addSubview(powerLabel)
        powerLabel.snp.makeConstraints { make in
            make.leading.equalTo(28)
            make.top.equalTo(massLabel.snp.bottom).offset(40)
        }
        
        view.addSubview(heightView)
        heightView.snp.makeConstraints { make in
            make.trailing.equalTo(-28)
            make.centerY.equalTo(heightLabel)
            make.width.equalTo(115)
            make.height.equalTo(40)
        }
        
        heightView.addSubview(metterHeightButton)
        metterHeightButton.snp.makeConstraints { make in
            make.width.equalTo(56)
            make.leading.equalTo(3)
            make.centerY.equalToSuperview()
            make.height.equalTo(34)
        }
        
        heightView.addSubview(ftHeightButton)
        ftHeightButton.snp.makeConstraints { make in
            make.width.equalTo(56)
            make.trailing.equalTo(-3)
            make.centerY.equalToSuperview()
            make.height.equalTo(34)
        }
        
        view.addSubview(diameterView)
        diameterView.snp.makeConstraints { make in
            make.trailing.equalTo(-28)
            make.centerY.equalTo(diameterLabel)
            make.width.equalTo(115)
            make.height.equalTo(40)
        }
        
        diameterView.addSubview(metterDiameterButton)
        metterDiameterButton.snp.makeConstraints { make in
            make.width.equalTo(56)
            make.trailing.equalTo(-3)
            make.centerY.equalToSuperview()
            make.height.equalTo(34)
        }
        
        diameterView.addSubview(ftDiameterButton)
        ftDiameterButton.snp.makeConstraints { make in
            make.width.equalTo(56)
            make.leading.equalTo(3)
            make.centerY.equalToSuperview()
            make.height.equalTo(34)
        }
        
        view.addSubview(massView)
        massView.snp.makeConstraints { make in
            make.trailing.equalTo(-28)
            make.centerY.equalTo(massLabel)
            make.width.equalTo(115)
            make.height.equalTo(40)
        }
        
        massView.addSubview(kilogramMassButton)
        kilogramMassButton.snp.makeConstraints { make in
            make.width.equalTo(56)
            make.leading.equalTo(3)
            make.centerY.equalToSuperview()
            make.height.equalTo(34)
        }
        
        massView.addSubview(ibMassButton)
        ibMassButton.snp.makeConstraints { make in
            make.width.equalTo(56)
            make.trailing.equalTo(-3)
            make.centerY.equalToSuperview()
            make.height.equalTo(34)
        }
        
        view.addSubview(powerView)
        powerView.snp.makeConstraints { make in
            make.trailing.equalTo(-28)
            make.centerY.equalTo(powerLabel)
            make.width.equalTo(115)
            make.height.equalTo(40)
        }
        
        powerView.addSubview(kilogramPowerButton)
        kilogramPowerButton.snp.makeConstraints { make in
            make.width.equalTo(56)
            make.leading.equalTo(3)
            make.centerY.equalToSuperview()
            make.height.equalTo(34)
        }
        
        powerView.addSubview(ibPowerButton)
        ibPowerButton.snp.makeConstraints { make in
            make.width.equalTo(56)
            make.trailing.equalTo(-3)
            make.centerY.equalToSuperview()
            make.height.equalTo(34)
        }
    }
    
    
    @objc func heightMeterTappet(){
        
    }
}

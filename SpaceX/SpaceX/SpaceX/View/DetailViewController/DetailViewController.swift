//
//  DetailViewController.swift
//  SpaceX
//
//  Created by Шермат Эшеров on 20/8/22.
//

import UIKit
import SnapKit
import Kingfisher

class DetailViewController: UIViewController {
    
    //MARK: Connect With ViewModel
    private lazy var viewModel: DetailViewModel = {
        return DetailViewModel()
    }()
    
    //MARK: Content Size for Scroll View
    private lazy var contentSize = CGSize(width: view.frame.width, height: view.frame.height + 200)
    
    private lazy var scrollView: UIScrollView = {
        let scrollV = UIScrollView(frame: .zero)
        scrollV.contentSize = contentSize
        scrollV.frame = view.bounds
        return scrollV
    }()
    
    //MARK: Content View
    private lazy var contentView: UIView = {
        let view = UIView()
        view.frame.size = contentSize
        return view
    }()
    
    //MARK: Backgorund Rocket Image
    private lazy var rocketImage: UIImageView = {
        let imageV = UIImageView()
        return imageV
    }()
    
    //MARK: Parent Black View
    private lazy var parentView: UIView = {
        let view = UIView()
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.layer.masksToBounds = true
        view.backgroundColor = .black
        view.layer.cornerRadius = 40
        return view
    }()
    
    //MARK: Title of StarShip
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .white
        label.text = "Falcon Heavy"
        return label
    }()
    
    //MARK: Settings Button
    private lazy var settingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        button.tintColor = .white
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: Collection View
    private lazy var collectionV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionV.delegate = self
        collectionV.dataSource = self
        collectionV.register(CustomCollectionCell.self, forCellWithReuseIdentifier: CustomCollectionCell.identifier)
        collectionV.showsHorizontalScrollIndicator = false
        collectionV.backgroundColor = .black
        return collectionV
    }()
    
    //MARK: First Flight Label
    private lazy var firstFlightLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1)
        label.font = .systemFont(ofSize: 16)
        label.text = "Первый запуск"
        return label
    }()
    
    //MARK: First Flight Infromation
    private lazy var firstFlightInfrom: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        label.text = "7 февраля, 2018"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    //MARK: Country Label
    private lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1)
        label.font = .systemFont(ofSize: 16)
        label.text = "Страна"
        return label
    }()
    
    //MARK: Country Infromation
    private lazy var countryInfrom: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        label.text = "США"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    //MARK: Coast Label
    private lazy var coastLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1)
        label.font = .systemFont(ofSize: 16)
        label.text = "Стоимость запуска"
        return label
    }()
    
    //MARK: Coast Infromation
    private lazy var coastInfrom: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        label.text = "$90 млн"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    //MARK: First Stage Label
    private lazy var firstStage: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "ПЕРВАЯ СТУПЕНЬ"
        return label
    }()
    
    //MARK: Engine Label
    private lazy var engineLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1)
        label.font = .systemFont(ofSize: 16)
        label.text = "Количество двигателей"
        return label
    }()
    
    //MARK: Engine Infromation
    private lazy var engineInfrom: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        label.text = "27"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    //MARK: Fuel Label
    private lazy var fuelLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1)
        label.font = .systemFont(ofSize: 16)
        label.text = "Количество топлива"
        return label
    }()
    
    //MARK: Fuel Information
    private lazy var fuelInfrom: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        label.text = "308,6"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    //MARK: Fuel Extenstion 'ton/kg/e.n.t.c'
    private lazy var fuelExtension: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1)
        label.font = .systemFont(ofSize: 16)
        label.text = "ton"
        return label
    }()
    
    //MARK: Burn Label
    private lazy var combustionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1)
        label.font = .systemFont(ofSize: 16)
        label.text = "Bремя сгорания"
        return label
    }()
    
    //MARK: Burn Time Information
    private lazy var combustionInfrom: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        label.text = "169 s"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    //MARK: Second Stage
    private lazy var secondStage: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "Bторая ступень".uppercased()
        return label
    }()
    
    //MARK: Engine Label
    private lazy var engineSecondLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1)
        label.font = .systemFont(ofSize: 16)
        label.text = "Количество двигателей"
        return label
    }()
    
    //MARK: Engine Information
    private lazy var engineSecondInfrom: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        label.text = "27"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    //MARK: Fuel Label
    private lazy var fuelSecondLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1)
        label.font = .systemFont(ofSize: 16)
        label.text = "Количество топлива"
        return label
    }()
    
    //MARK: Fuel Information
    private lazy var fuelSecondInfrom: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        label.text = "308,6"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    //MARK: Fuel Extension
    private lazy var fuelSecondExtension: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1)
        label.font = .systemFont(ofSize: 16)
        label.text = "ton"
        return label
    }()
    
    //MARK: Burn Time Label
    private lazy var combustionSecondLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1)
        label.font = .systemFont(ofSize: 16)
        label.text = "Bремя сгорания"
        return label
    }()
    
    //MARK: Burn Time Information
    private lazy var combustionSecondInfrom: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        label.text = "169 s"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupScollView()
    }
    
    //MARK: SetUp Scroll View Components
    func setupScollView(){
        scrollView.backgroundColor = .black
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        setupUI()
    }
    
    //MARK: SetUp All UI Components
    func setupUI(){
        contentView.addSubview(rocketImage)
        rocketImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(350)
        }
        
        contentView.addSubview(parentView)
        parentView.snp.makeConstraints { make in
            make.top.equalTo(300)
            make.bottom.trailing.leading.equalToSuperview()
        }
        
        parentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(32)
            make.top.equalTo(48)
        }
        
        parentView.addSubview(settingButton)
        settingButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.trailing.equalTo(-35)
            make.width.height.equalTo(32)
        }
        
        parentView.addSubview(collectionV)
        collectionV.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
            make.leading.equalTo(32)
            make.trailing.equalToSuperview()
            make.height.equalTo(96)
        }
        
        parentView.addSubview(firstFlightLabel)
        firstFlightLabel.snp.makeConstraints { make in
            make.leading.equalTo(32)
            make.top.equalTo(collectionV.snp.bottom).offset(40)
        }
        
        parentView.addSubview(firstFlightInfrom)
        firstFlightInfrom.snp.makeConstraints { make in
            make.trailing.equalTo(-32)
            make.centerY.equalTo(firstFlightLabel)
        }
        
        parentView.addSubview(countryLabel)
        countryLabel.snp.makeConstraints { make in
            make.leading.equalTo(32)
            make.top.equalTo(firstFlightLabel.snp.bottom).offset(16)
        }
        
        parentView.addSubview(countryInfrom)
        countryInfrom.snp.makeConstraints { make in
            make.trailing.equalTo(-32)
            make.centerY.equalTo(countryLabel)
        }
        
        parentView.addSubview(coastLabel)
        coastLabel.snp.makeConstraints { make in
            make.leading.equalTo(32)
            make.top.equalTo(countryLabel.snp.bottom).offset(16)
        }
        
        parentView.addSubview(coastInfrom)
        coastInfrom.snp.makeConstraints { make in
            make.trailing.equalTo(-32)
            make.centerY.equalTo(coastLabel)
        }
        
        parentView.addSubview(firstStage)
        firstStage.snp.makeConstraints { make in
            make.leading.equalTo(32)
            make.top.equalTo(coastLabel.snp.bottom).offset(40)
        }
        
        parentView.addSubview(engineLabel)
        engineLabel.snp.makeConstraints { make in
            make.leading.equalTo(32)
            make.top.equalTo(firstStage.snp.bottom).offset(16)
        }
        
        parentView.addSubview(engineInfrom)
        engineInfrom.snp.makeConstraints { make in
            make.trailing.equalTo(-32)
            make.centerY.equalTo(engineLabel)
        }
        
        parentView.addSubview(fuelLabel)
        fuelLabel.snp.makeConstraints { make in
            make.leading.equalTo(32)
            make.top.equalTo(engineLabel.snp.bottom).offset(16)
        }
        
        parentView.addSubview(fuelInfrom)
        fuelInfrom.snp.makeConstraints { make in
            make.trailing.equalTo(-32)
            make.centerY.equalTo(fuelLabel)
        }
        
        parentView.addSubview(combustionLabel)
        combustionLabel.snp.makeConstraints { make in
            make.leading.equalTo(32)
            make.top.equalTo(fuelLabel.snp.bottom).offset(16)
        }
        
        parentView.addSubview(combustionInfrom)
        combustionInfrom.snp.makeConstraints { make in
            make.trailing.equalTo(-32)
            make.centerY.equalTo(combustionLabel)
        }
        
        parentView.addSubview(secondStage)
        secondStage.snp.makeConstraints { make in
            make.leading.equalTo(32)
            make.top.equalTo(combustionLabel.snp.bottom).offset(40)
        }
        
        parentView.addSubview(engineSecondLabel)
        engineSecondLabel.snp.makeConstraints { make in
            make.leading.equalTo(32)
            make.top.equalTo(secondStage.snp.bottom).offset(16)
        }
        
        parentView.addSubview(engineSecondInfrom)
        engineSecondInfrom.snp.makeConstraints { make in
            make.trailing.equalTo(-32)
            make.centerY.equalTo(engineSecondLabel)
        }
        
        parentView.addSubview(fuelSecondLabel)
        fuelSecondLabel.snp.makeConstraints { make in
            make.leading.equalTo(32)
            make.top.equalTo(engineSecondLabel.snp.bottom).offset(16)
        }
        
        parentView.addSubview(fuelSecondInfrom)
        fuelSecondInfrom.snp.makeConstraints { make in
            make.trailing.equalTo(-32)
            make.centerY.equalTo(fuelSecondLabel)
        }
        
        parentView.addSubview(combustionSecondLabel)
        combustionSecondLabel.snp.makeConstraints { make in
            make.leading.equalTo(32)
            make.top.equalTo(fuelSecondLabel.snp.bottom).offset(16)
        }
        
        parentView.addSubview(combustionSecondInfrom)
        combustionSecondInfrom.snp.makeConstraints { make in
            make.trailing.equalTo(-32)
            make.centerY.equalTo(combustionSecondLabel)
        }
    }
    
    //MARK: View Model Binder
    func bindViewModel(){
        viewModel.shareData()
        viewModel.items.bind { _ in
            DispatchQueue.main.async { [self] in
                collectionV.reloadData()
                setDataComponents()
            }
        }
    }
    
    //MARK: Set Data From Network
    func setDataComponents(){
        DispatchQueue.main.async { [self] in
            guard let images = viewModel.items.value.flickrImages.randomElement() else { return }
            rocketImage.kf.indicatorType = .activity
            rocketImage.kf.setImage(with: URL(string: images), placeholder: nil, options: nil, completionHandler: nil)
            let totalItems = viewModel.items.value
            titleLabel.text = totalItems.name
            firstFlightInfrom.text = totalItems.firstFlight
            countryInfrom.text = totalItems.country
            coastInfrom.text = "$\(totalItems.costPerLaunch.description.prefix(2))млн"
            countryInfrom.text = totalItems.country
            
            let firstStage = viewModel.items.value.firstStage
            engineInfrom.text = firstStage.engines.description
            fuelInfrom.text = firstStage.fuelAmountTons.description
            combustionInfrom.text = firstStage.burnTimeSEC?.description
            
            let secondStage = viewModel.items.value.secondStage
            engineSecondInfrom.text = secondStage.engines.description
            fuelSecondInfrom.text = secondStage.fuelAmountTons.description
            combustionSecondInfrom.text = firstStage.burnTimeSEC?.description
        }
    }
    
    //MARK: Get id And Send To Network
    func getId(id: String){
        viewModel.getId(id: id)
        bindViewModel()
    }
    
    //MARK: Open Settings VC By Tap
    @objc func settingsButtonTapped(){
        let vc = SettingsViewController()
        present(vc, animated: true, completion: nil)
    }
}


//MARK: Extenstion Of Collection View
extension DetailViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{

    //MARK: Count of Horizontal Items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let items = viewModel.items.value
        var datas: [String] = []
        datas.append(items.height.feet?.description ?? "")
        datas.append(items.diameter.feet?.description ?? "")
        datas.append(items.mass.kg.description)
        datas.append(items.payloadWeights.description)
        return datas.count
    }
    
    //MARK: Work With Custom Collection Cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionCell.identifier, for: indexPath) as? CustomCollectionCell else { return CustomCollectionCell(frame: .zero)}
        let items = viewModel.items.value
        var datas: [String] = []
        datas.append(items.height.feet?.description ?? "")
        datas.append(items.diameter.feet?.description ?? "")
        datas.append(items.mass.kg.description)
        datas.append(items.payloadWeights.first?.lb.description ?? "")
        
        let itemsData = ["Высота, ft", "Диаметр, ft", "Масса, lb", "Нагрузка, lb"]
        cell.fetchData(infrom: datas[indexPath.row], infromlabel: itemsData[indexPath.row])
        return cell
    }
    
    //MARK: Set Size of Custom Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 96, height: 96)
    }
}

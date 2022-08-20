//
//  ViewController.swift
//  SpaceX
//
//  Created by Шермат Эшеров on 19/8/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var viewModel: MainViewModel = {
        return MainViewModel()
    }()
    
    private lazy var spaceXLabel: UILabel = {
        let label = UILabel()
        label.text = "SpaceX"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        return label
    }()
    
    private lazy var tableV: UITableView = {
        let tableV = UITableView()
        tableV.register(CustomTableCell.self, forCellReuseIdentifier: CustomTableCell.identifier)
        tableV.delegate = self
        tableV.dataSource = self
        tableV.separatorStyle = .none
        return tableV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setUI()
        
    }
    
    func setUI(){
        view.addSubview(spaceXLabel)
        spaceXLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
        }
        
        view.addSubview(tableV)
        tableV.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(spaceXLabel.snp.bottom).offset(50)
        }
    }
    
    func bindViewModel(){
        viewModel.shareData()
        viewModel.items.bind { _ in
            DispatchQueue.main.async { [self] in
                tableV.reloadData()
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomTableCell()
        let items = viewModel.items.value[indexPath.row]
        cell.fetchData(title: items.name, date: items.company, active: items.active)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.getId(id: indexPath.row.description)
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            DispatchQueue.main.async {
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
    
}

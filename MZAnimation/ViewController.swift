//
//  ViewController.swift
//  MZAnimation
//
//  Created by Mr.Z on 2020/6/29.
//  Copyright © 2020 Mr.Z. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var dataSource = [String]()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.clear
        tableView.estimatedRowHeight = 40.0
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "动画"
        self.view.backgroundColor = UIColor.white
        self.dataSource = ["Lottie动画", "EasyAnimation动画", "Replicator动画"]
        self.tableView.frame = self.view.bounds
        self.tableView.tableFooterView = UIView()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        self.view.addSubview(self.tableView)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = self.dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let vc = MZLottieAnimationVC()
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 1 {
            let vc = MZEasyAnimationVC()
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 2 {
            let vc = MZReplicatorAnimationVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

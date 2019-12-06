//
//  ResultsViewController.swift
//  DBMS_Project
//
//  Created by Aibol Tungatarov on 11/28/19.
//  Copyright © 2019 Aibol Tungatarov. All rights reserved.
//

import UIKit
import SnapKit

class ResultsViewController: UIViewController {
    let cellId = "ResultTableViewCell"
    var results: [Result] = []
    lazy var resultsTableViewController: UITableView = {
        let tv = UITableView()
        tv.register(ResultTableViewCell.self, forCellReuseIdentifier: cellId)
        tv.dataSource = self
        tv.delegate = self
        tv.isScrollEnabled = true
        tv.rowHeight = UITableView.automaticDimension
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        results.append(Result())
        results.append(Result())
        configUI()
        makeConstraints()
    }
}



///MARK: UITableView Delegates
extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ResultTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    
}


//MARK: ConfigUI and Constraints
extension ResultsViewController {
    func configUI() {
        view.addSubview(resultsTableViewController)
    }
    
    func makeConstraints() {
        resultsTableViewController.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

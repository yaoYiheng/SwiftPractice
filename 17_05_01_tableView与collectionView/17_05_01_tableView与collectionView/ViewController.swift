//
//  ViewController.swift
//  17_05_01_tableView与collectionView
//
//  Created by 姚懿恒 on 2017/5/1.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

//        setupTableView()
    }

    //MARK: -数据源方法
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20 
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)

        return cell;

    }

    //MARK: -重写该方法, 可以实现拖拽
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {

    }
    //MARK: -UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"

        return cell


    }
    //MARK: -创建控件
    func setupTableView() -> Void {
        let tableView = UITableView.init(frame: view.bounds, style: .plain)
        tableView.backgroundColor = UIColor.lightGray
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        view.addSubview(tableView)
    }

}


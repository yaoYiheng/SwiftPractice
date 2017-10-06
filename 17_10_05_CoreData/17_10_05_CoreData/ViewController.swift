//
//  ViewController.swift
//  17_10_05_CoreData
//
//  Created by 姚懿恒 on 2017/10/5.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //生成上下文, 关联文件模型生成数据库

        //1. 获取上下文
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)

        //上下文关联数据库
        let model = NSManagedObjectModel.mergedModel(from: nil)

        //持久化存储调度器
        let store = NSPersistentStoreCoordinator.init(managedObjectModel: model!)

        //告诉store数据库的路径

        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, .allDomainsMask, true).first
        let urlPath = URL.init(string: path!)

        let url = urlPath?.appendingPathComponent("company.sqlite")

        
        store.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url!, options: <#T##[AnyHashable : Any]?#>)



        context.persistentStoreCoordinator = store

    }


}


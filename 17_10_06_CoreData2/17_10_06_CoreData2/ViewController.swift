//
//  ViewController.swift
//  17_10_06_CoreData2
//
//  Created by 姚懿恒 on 2017/10/6.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext


    override func viewDidLoad() {
        super.viewDidLoad()

        //获取context





    }


    /// 添加50员工
    private func addFIfty() {
        for item in 0...50 {
            let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context) as! Employee
            employee.name = "张\(item)"
            employee.height = Float(item)
            employee.birthday = NSDate()

        }

        if context.hasChanges {
            do {
                print("保存成功")
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }


    /// 添加一个
    @IBAction func add() {
        let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context) as! Employee

        employee.name = "123"
        employee.height = 12.32
        employee.birthday = NSDate()

        if context.hasChanges {
            do {
                print("保存成功")
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    /// 删
    @IBAction func delete() {
    }

    /// 改
    @IBAction func modify() {
    }

    /// 查
    @IBAction func find() {
    }
    
}


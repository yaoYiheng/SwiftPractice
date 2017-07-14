//
//  ListTableViewController.swift
//  17_06_06_私人通讯录
//
//  Created by 姚懿恒 on 2017/6/6.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    var dataList = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()


        loadData { (list) in

            //拼接数组, 闭包中定义好的代码, 在需要的时候执行, 需要使用self.指定语境
            self.dataList += list

            //刷新表格
            self.tableView.reloadData()
        }





    }

    //模拟异步加载数据, 闭包回调
    private func loadData(copmletion: @escaping (_ list: [Person])->()) ->(){

        DispatchQueue.global().async { 
            print("加载中...")

            sleep(2)

            //创建一个可变数组, 以保存Person对象
            var array = [Person]()

            //模拟加载数据
            for each in 0..<20{

                let person = Person()
                person.name = "Zhang\(each)"
                person.phone = "1523" + String(format: "%06d", arc4random_uniform(100000))
                person.title = "Boss"

                //保存至数组.
                array.append(person)

            }

            //回主线程将数组传出.

            DispatchQueue.main.async(execute: { 
                copmletion(array)

            })

        }

    }
    @IBAction func addNewPerson(_ sender: Any) {
        performSegue(withIdentifier: "listToDetail", sender: nil)
    }

    //MARK: -数据源方法
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)


        cell.textLabel?.text = dataList[indexPath.row].name
        cell.detailTextLabel?.text = dataList[indexPath.row].phone

        
        return cell

    }
    //MARK: -代理方法
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        //在使用storyboard时, 进行页面的跳转以及传值
        performSegue(withIdentifier: "listToDetail", sender: indexPath)
    }
     
    //MARK: -控制器跳转
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        //转换类型是使用as
        // as! 还是as? 直接可以根据as前面的返回值来判定
        //注意: if let /guard let这样的判空语句一律使用 'as?'

        let vc = segue.destination as! DetailTableViewController

        //通过indexPath, 从数组中取出对应的元素, 
        //sender 是any类型,也是一个可选值, 使用'as?'

        if let indexPath = sender as? IndexPath {
            //到此indexPath一定有值, 通过indexPath将值传给目标控制器
            vc.person = dataList[indexPath.row]

            //定义闭包,编辑个人闭包
            vc.completionCallBack = {
                //刷新表格
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }


        }else{

            //新建个人闭包

            //可根据不同的需求传递不同的代码

            vc.completionCallBack = {[weak vc] in
            //1. 拿到明细控制器的person
            guard let realPerson = vc?.person else {
                return
            }

            //2. 插入到数组的顶部

            self.dataList.insert(realPerson, at: 0)

            //3. 刷新表格

            self.tableView.reloadData()
                
            }
            
        }

    }
}

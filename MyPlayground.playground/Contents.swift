import UIKit

let name :String?
let age :Int?

name = "L"
age = 10


/// 通过if let, 对可选值进行判断.只有当可选值不为nil时, 才会执行以下代码.
if let name = name, let age = age {
    print(name + String(age))

}

func demo(name: String?, age: Int?){


    /// 守护: 如果传入的参数为nil, 执行{}内容, 并返回.
    guard let myName = name, let myAge = age else {
        print("myName或myAge为空")

        return
    }

    //----能来到以下代码, 说明所有类型为Optional的变量都是有值的.
    print(myName + String(myAge))

}

demo(name: "小米", age: 12)
demo(name: "小饼", age: nil)


//17_04_28

//问号操作符

func demo1(x: Int?, y: Int?){

    print((x ?? 0) + (y ?? 0))



}

/*
    ??可以看做一个简单的三目运算符
    如果参数不为nil, 则使用参数的值, 如果参数为nil, 则使用??后面的值
 */
demo1(x: 23, y: nil)
demo1(x: 11, y: 22)
demo1(x: nil, y: nil)

let Name: String? = "小猪"

// ?? 操作符的优先级较低
print((Name ?? "") + "你好")
print(Name ?? "" + "你好")



/**************************/


//if let/var 的用法

/*
    if let 用来判断对象的值是否为nil, 而{}内是一定有值的, 不需要解包
    if var 同样可以用来判断对象的值是否为nil, 但可以对值进行修改.
 */
func demo2(name: String?, age: Int?)
{
    if let InName = name, let inAge = age
    {
        print(InName + String(inAge))
    }

    if var inName = name, let inage = age{
        inName = inName + "酱"
        print(inName  + String(inage))
    }
}
demo2(name: "小猪", age: 12)

/*
    let 常量的可选值在使用前需要进行初始化
    var 变量的可选值默认为nil

 */


/**************************/


//Switch的用法
/*
    1.switch 可以针对任意类型的值进行分支, 不像OC一样只局限与整数
    2.switch 一般不需要写break, 除非该分支一条语句都没有, 才需要加break.
    3.switch 如果要多值, 使用", " 进行分隔
 */

func switchDomo(score:Double){
    switch score {
    case 90, 100:
        print("Very Good")
    case 70, 89:
        print("Good")

    case 60:
        break
    default:
        print("Bad")
    }

}

switchDomo(score: 99)
switchDomo(score: 78)

/**************************/

//for循环的用法


//[0, 4]
//let range = 0...4
//类型为:CountableClosedRange

//for i in range {
//    print(i)
//}

//[0, 4)CountableRange
//反转遍历
let range1 = 0..<4
for i in range1.reversed() {
    print(i)
}

//字符串的遍历
let str = "失败只有一种, 那就是半途而废"
for each in str.characters {
    print(each)
}
//求字符串的长度
print(str.characters.count)

//17_04_29

//字符串的拼接

let str1 = "city"
let str2 = "fitness"

let str3 = "\(str1) \(str2)"

let hour = 9
let min = 22
let sec = 23

//字符数组
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
//将字符数组转换成字符串
let catString = String(catCharacters)
print(catString)
// Prints "Cat!🐱"

/*
 字符串的格式化
 String(format: "", ...)
 */

let currentTime = String(format: "The current time is %02d: %02d: %02d", hour, min, sec)
let timeString = String(format: "The current time is %02d:%02d", 10, 4)

/*

 
 使用startIndex能够访问一个字符串的首字符
 endIndex属性 是位于字符串最后一个字符的位置.
 endIndex属性并不是一个有效的字符串下标.
 如果字符串为空, startIndex与endIndex相等

 */

var welcome = "hello"

/*
 字符串的插入:
 在字符串的末尾插入!
 */
welcome.insert("!", at: welcome.endIndex)
// welcome now equals "hello!"

welcome.insert(contentsOf: " there".characters, at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there!"


let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
let subStri = welcome


/*
 字符串的移除
 */
//移除指定index处的字符
welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there"
//移除一个范围内的字符串

/*
    子字符串的截取
 1. 先获取待截取的字字符串的 subRange
 2. 调用.substring(with: subRange)
 
 也可调用from...
 或to...
 */

welcome
let subRange = welcome.index(welcome.startIndex, offsetBy: 2)..<welcome.index(welcome.startIndex, offsetBy: 4)

let subStr = welcome.substring(with: subRange)

let subStr1 = welcome.substring(to: welcome.index(welcome.endIndex, offsetBy: -2))

let subStr2 = welcome.substring(from: welcome.index(welcome.endIndex, offsetBy: -2))

/**************************/


//17_04_30

//数组相关



let point = CGPoint.init(x: 20, y: 10)
let array1:[Any] = [1, "hello", 1.2, point]

//数组的遍历

//方式1: 使用下标
for index in 0..<array1.count {
    print(array1[index])
}
//方式2: for in 遍历元素
for each in array1 {
    print(each)
}

//方式三: enum block遍历,可以同时遍历下标与内容
for each in array1.enumerated(){
    print("\(each.offset) \(each.element)")
}

//方式四: (n, s)遍历元组中的内容
for (n, s) in array1.enumerated(){
    print("\(n) \(s)")
}

//方式五: 反序遍历
for each in array1.reversed() {
    print(each)
}
//方式六: 先枚举  -> 再反序
for each in array1.enumerated().reversed(){
    print(each.offset, each.element)
}
//先反序 -> 再枚举
for each in array1.reversed().enumerated(){
    print(each.offset, each.element)
}

var food:[Any] = ["photo chips", "banana", "chocolate"]
let meat:[Any] = ["beaf", "pork", "chicken", 12]
//合并
food += meat
print(food)

//改, 通过数组下标
food[0] = "pizza"
print(food)
//增加
food.append("noodles")
//删除
food.remove(at: 4)
food.removeAll()

//字典
var dict1: [String: Any] = ["name": "Harry", "age": 12, "gender": "male"]
let dict2: [String :Any] = ["height": 1.8, "weight": 55]

//向字典中增加新元素,
dict1.updateValue("1b/49", forKey: "address")
print(dict1)

/**
 如果key不存在则新添加
 如果key存在, 则修改之前key所对应的值
 */
dict1["title"] = "Boss"
print(dict1)
//字典的变量
for each in dict1 {
    print("Key: \(each.key) --> Value: \(each.value)")
    print(each)
}

for (key, vaule) in dict1 {
    print(key, vaule)
}
//通过key删除value
dict1.removeValue(forKey: "name")
//You can use subscript syntax to remove a key-value pair from a dictionary by assigning a value of nil for that key
//也可以通过将nil赋值给某个key, 也能删除
dict1["title"] = nil
print(dict1)

var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
/*
 Unlike a subscript, however, the updateValue(_:forKey:) method returns the old value after performing an update. This enables you to check whether or not an update took place.
 然而不像下边, 该方法会在完成一次更新后返回一个 '旧'的值, 这能够使你检查是否发生了更新
 */
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB"),
    let newValue = airports["DUB"]
{
    print("The old value for DUB was \(oldValue).And the new value for DUB is \(newValue)")
}
airports["APL"] = "Apple International"
//airports["APL"] = nil
print(airports)

/*
 If you need to use a dictionary’s keys or values with an API that takes an Array instance, initialize a new array with the keys or values property
如果需要将一个字典的值, 或键装入一个数组中, 请使用keys或values属性初始化新数组
 */
let info = [Any](dict1.values)


//17_05_02_函数相关

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Harry"))

func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
/*
 Note that this function is distinct from the greet(person:) function shown in an earlier section. Although both functions have names that begin with greet, the greet(person:alreadyGreeted:) function takes two arguments but the greet(person:) function takes only one.

注意: 这个方法与之前的greet(person:)有所不同, 尽管两个方法都含有名字greet, 但是后者的方法有两个参数, 前者只有一个

 */

print(greet(person: "Harry", alreadyGreeted: false))

//The return value of a function can be ignored when it is called
//方法的返回值在调用时可以被忽略
func printAndCount(string: String) -> Int{
    print(string)
    return string.characters.count
}
print(printAndCount(string: "to be or not to be"))

//下划线可以用来忽略不感兴趣的内容, 比如说这里的返回值
func printWithoutCount(string: String){
    let _ = printAndCount(string: string)

}
printWithoutCount(string: "Hello")

/*
 NOTE

 Return values can be ignored, but a function that says it will return a value must always do so. A function with a defined return type cannot allow control to fall out of the bottom of the function without returning a value, and attempting to do so will result in a compile-time error.
 注意:
 虽然返回值可以被忽略, 但是如果一个方法在定义的时候是有返回值的话, 就必须注意做.
 定义一个具有返回值的方法不允许控制从函数底部退出而不返回值, 如果一定要这样做, 将会报编译错误.

 */

//外部参数
/*
    外部参数就是在形参的前面添加的额外名字
    外部参数并不会影响函数内部细节
    在调用函数时, 外部参数能够使调用更加直观
    外部参数如果是 "_" 下划线, 在外部调用时会忽略形参的名字
 */
func sum(x: Double, y: Double) ->Double{
    return x + y
}
print(sum(x: 12, y: 23))

func sum(number1 x: Double, number2 y: Double) ->Double{
    return x + y
}
print(sum(number1: 12, number2: 23))

func sum(_ x: Double, _ y: Double) ->Double{
    return x + y
}
print(sum(12, 23))

//函数的默认值
/*
    在定义函数时, 可以给参数传入默认值,
    在调用时, 如果不传值, 就不调用默认值, 如果传值, 就会按照传入值进行计算
    这样做相较于OC, 非常灵活.
    - 在OC中, 常常要写多个方法的声明以及实现, 最终调用包含了所有参数的函数, 而
    在Swift中, 可以通过使用一个设置了默认值的函数完成.
 */
func sum1(number1 x: Double = 10, number2 y: Double = -10) ->Double{

    return x + y
}
print(sum1())               //执行 默认值10 + 默认值(-10)
print(sum1(number1: 20))    //执行20 + 默认值(-10)
print(sum1(number2: 20))    //执行 默认值10 + 20
print(sum1(number1: 20, number2: 40)) //执行传入的值


func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}

var currentValue = -5
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
//现在这个moveNearerToZero常量指向嵌套函数中的stepForward()函数
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")


//17_05_03_闭包
/*应用场景:
    *异步执行完回调
    *控制器间的回调
    *自定义视图回调
 
 回调特点:
    *以参数回调处理结果
    *返回值为Void

 */
//简单的闭包, 没有参数没有返回值
let closures1 = {
    print("Hello World")
}
closures1()

//带有两个参数, 有一个返回值的闭包
//参数, 返回值, 实现都是写在{}中, 需要使用关键字 'in' 分隔定义与实现
//{(参数列表) -> (返回值类型) in ...实现...}
let closures2 = {
    (x: Int, y: Int) -> Int in

    return x + y
}
print(closures2(12, 23))

let test = closures2
test(11, 22)

//"队列"调度任务(block/ 闭包), 以"同步\异步"的方式执行
DispatchQueue.global().async {
    print("耗时操作\(Thread.current)")

    //回主线程更新UI
    DispatchQueue.main.async {
        print("更新UI\(Thread.current)")
    }
//    DispatchQueue.main.async(execute: { 
//        print("更新UI\(Thread.current)")
//    })
}
print("更新UI\(Thread.current)")

func someFunctionThatTakesAClosures(closures: (_ x: Int, _ y: Int) -> Int) {

}

//17_05_04
//尾随闭包
let dict: [String: Any] = ["name": "小饼", "age": 12]

//17_05_06_闭包, 还是闭包
/*
 Closure expression syntax has the following general form:
 闭包格式如下
 { (parameters) -> return type in
 statements
 }
 */

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
let numbers = [1, 22, -1, 33, 0]

var reversedNumbers = numbers.sorted()


func backward( s1: String, s2: String) -> Bool {
    return s1 > s2
}
//将另外一些函数(backward)作为该函数(sorted)的参数
var reversedNames = names.sorted(by: backward)
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
/*
 Because the sorting closure is passed as an argument to a method, Swift can infer the types of its parameters and the type of the value it returns. The sorted(by:) method is being called on an array of strings, so its argument must be a function of type (String, String) -> Bool. This means that the (String, String) and Bool types do not need to be written as part of the closure expression’s definition. Because all of the types can be inferred, the return arrow (->) and the parentheses around the names of the parameters can also be omitted
 因为sorting闭包被当做一个参数传递给了方法, Swift能够推断出实参以及其返回值的类型.
 sorted(by:) method 该方法被一个字符串数组调用, 所以它的实参的类型一定是(String, String) -> Bool类型.
 这就意味着(String, String) 与 Bool类型, 不需要写在闭包的定义中, 因为所有的类型都能被推断出
 返回箭头 -> 和 包裹着实参名的括号都可以被省略.

 */

reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
/*
    字母表中越靠后的字母的值越大
 */
let s1 = "aac"
let s2 = "adc"



//17_05_07_必选属性的构造过程
class Person: NSObject{

}
let p1 = Person()
print(p1)



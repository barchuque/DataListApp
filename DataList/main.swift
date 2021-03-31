import Foundation

var dataList = DataList()

dataList.add(Data(number: 1, name: "C"))
dataList.add(Data(number: 5, name: "A"))
dataList.add(Data(number: 3, name: "D"))
dataList.add(Data(number: 4, name: "E"))
dataList.add(Data(number: 5, name: "B"))

//dataList.sort{
//    return $0.number < $1.number
//}

dataList.doubleSort()

for data in dataList.toArray() {
    print(data.number, data.name)
}







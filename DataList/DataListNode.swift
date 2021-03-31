//Узел односвязного списка со значением Data

class DataListNode {
    var value: Data
    var nextNode: DataListNode?
    
    init(value: Data){
        self.value = value
    }
    
    deinit {
        print("Node with value \(value) deinit!")
    }
}

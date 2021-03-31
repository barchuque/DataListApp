//Класс определяющий односвязный список из узлов со значением Data
//Представлены только необходимые методы для выполнения задания

class DataList {
    private var head: DataListNode?
    var count: Int = 0
    
    //Добавление узла в конец списка
    func add(_ element: Data) {
        guard var currentNode = head else {
            head = DataListNode(value: element)
            count += 1
            return
        }
        
        while let nextNode = currentNode.nextNode {
            currentNode = nextNode
        }
        
        currentNode.nextNode = DataListNode(value: element)
        count += 1
    }
    
    //Получение или изменение значения существующего узла
    subscript(_ index: Int) -> Data {
        get {
            guard var currentNode = head, index >= 0 else { fatalError("Index out of bounds for length!") }
            
            for _ in 0..<index {
                if let nextNode = currentNode.nextNode {
                    currentNode = nextNode
                } else {
                    fatalError("Index out of bounds for length!")
                }
            }
            
            return currentNode.value
        }
        
        set {
            guard var currentNode = head, index >= 0 else { fatalError("Index out of bounds for length!") }
            
            for _ in 0..<index {
                if let nextNode = currentNode.nextNode {
                    currentNode = nextNode
                } else {
                    fatalError("Index out of bounds for length!")
                }
            }
            
            currentNode.value = newValue
        }
    }
    
    //Преобразование списка в массив значений
    func toArray() -> [Data]{
        guard var currentNode = head else { return [Data]() }
        var valueArray = [currentNode.value]
        
        while let nextNode = currentNode.nextNode {
            currentNode = nextNode
            valueArray.append(nextNode.value)
        }
        
        return valueArray
    }
    
    //Заполнение списка из массива [Data]
    func fromArray(_ array: [Data]){
        for element in array {
            self.add(element)
        }
    }
    
    func clear() {
        head = nil
        count = 0
    }
    
    //Сортировка узлов по любому из полей
    func sort(by areInIncreasingOrder: (Data, Data) -> Bool){
        var node = head
        var secondNode = head
        var nextNode = node
            
        while node != nil{
            nextNode = nextNode?.nextNode
            secondNode = head
            
            while secondNode?.nextNode != nil{
                if !areInIncreasingOrder(secondNode!.value, secondNode!.nextNode!.value) {
                    let temp = secondNode?.value
                    secondNode?.value = (secondNode?.nextNode!.value)!
                    secondNode?.nextNode!.value = temp!
                }
                
                secondNode = secondNode?.nextNode
            }
            
            node = nextNode
        }
    }
     
    //Двойная сортировка по возрастанию
    func doubleSort() {
        guard head != nil && count > 1 else {
            return
        }
        var dataArray = self.toArray()
        
        dataArray.sort{
            if $0.number < $1.number { return true }
            if $0.number > $1.number { return false }
            
            if $0.name < $1.name { return true }
            if $0.name > $1.name { return false }
            return false
        }
        self.clear()
        self.fromArray(dataArray)
    }
}

import Foundation

struct Queue<T> {
    private var elements: [T] = []
    
    mutating func push(element: T) { //добавляем элемент типа Т
        elements.append(element)
    }
    
    mutating func pop() -> T? { //извлекаем последний элемент типа Т
        return elements.removeLast()
    }
    
    mutating func filter (status: (T) -> Bool) -> [T] { //фильтруем на подходящие значения
        
        var newArray: [T] = []
        
        for element in elements {
            if status(element){
                newArray.append(element)
            }
        }
        
        return newArray
    }
    
    mutating func sorted (by: (T,T) -> Bool) -> [T] { // сортируем по возрастанию/убыванию алфавита
        
        var newArray: [T] = elements
        
        for _ in 1...newArray.count {
            for j in 0...newArray.count-2 {
                if by(newArray[j],newArray[j+1]) {
                    let value: T = newArray[j]
                    newArray[j] = newArray[j+1]
                    newArray[j+1] = value
                }
            }
        }
        
        return newArray
    }
    
    subscript (indexes: Int...) -> [T]? {
        
        var newArray: [T] = []
        
        for index in indexes {
            if index < self.elements.count {
                newArray.append(elements[index])
            } else {
                return nil
            }
        }
        
        return newArray
    }
}

var queue1: Queue<String> = Queue<String>()

queue1.push(element: "Chelyabinsk")
queue1.push(element: "Abakan")
queue1.push(element: "Dubna")
queue1.push(element: "Bryansk")
queue1.push(element: "Astrakhan")
queue1.push(element: "Gatchina")
queue1.push(element: "Anapa")

print(queue1)

print(queue1.filter(status: {(element: String) -> Bool in return element == "A"}))

print(queue1.sorted(by: <))
print(queue1.sorted(by: >))

print(queue1.pop())

print(queue1[0,1])

print(queue1[7])

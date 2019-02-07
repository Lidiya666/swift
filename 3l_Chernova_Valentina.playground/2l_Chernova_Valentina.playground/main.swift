import Foundation

enum Engine: String {
    case run = "двигатель запущен", drown = "двигатель остановлен"
}

enum Window: String {
    case open = "окна открыты", close = "окна закрыты"
}

enum typeCar: String {
    case car = "легковой автомобиль"
    case truck = "грузовой автомобиль"
}

enum Luggage: String {
    case full = "Полный багажник"
    case medium = "Полупустой багажник"
    case empty = "Пустой багажник"
}

struct Car {
    var type: typeCar
    var mark: String
    var yearIssue: Int
    var capLuggage: Int
    var isEngine: Engine
    var isWindow: Window
    var isLuggage: Luggage
    
    mutating func changeWindow(){
        if isWindow == Window.close {
            isWindow = Window.open
        } else {
            isWindow = Window.close
        }
    }
}

var car1 = Car (type: .car, mark: "Hyundai", yearIssue: 2015, capLuggage: 510, isEngine: .drown, isWindow: .close, isLuggage: .full)
var car2 = Car (type: .car, mark: "Lexus", yearIssue: 2017, capLuggage: 570, isEngine: .drown, isWindow: .open, isLuggage: .medium)
var truck1 = Car (type: .truck, mark: "Mitsubishi", yearIssue: 2010, capLuggage: 600, isEngine: .run, isWindow: .close, isLuggage: .empty)

car1.changeWindow()
car2.changeWindow()

// print(car1) - выводится не красиво

print("\(car1.type.rawValue) - \(car1.mark) - \(car1.yearIssue) года выпуска - \(car1.capLuggage)л - \(car1.isEngine.rawValue) - \(car1.isWindow.rawValue) - \(car1.isLuggage.rawValue)")
print("\(car2.type.rawValue) - \(car2.mark) - \(car2.yearIssue) года выпуска - \(car2.capLuggage)л - \(car2.isEngine.rawValue) - \(car2.isWindow.rawValue) - \(car2.isLuggage.rawValue)")
print("\(truck1.type.rawValue) - \(truck1.mark) - \(truck1.yearIssue) года выпуска - \(truck1.capLuggage)л - \(truck1.isEngine.rawValue) - \(truck1.isWindow.rawValue) - \(truck1.isLuggage.rawValue)")

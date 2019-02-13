import Foundation

enum Engine: String {
    case run = "двигатель запущен", drown = "двигатель остановлен"
}

enum Window: String {
    case open = "окна открыты", close = "окна закрыты"
}

enum Luggage: String {
    case full = "полный багажник", medium = "полупустой багажник", empty = "пустой багажник"
}

protocol Car {
    var mark: String {get set}
    var yearIssue: Int {get set}
    var capLuggage: Int {get set}
    var isEngine: Engine {get set}
    var isWindow: Window {get set}
    var isLuggage: Luggage {get set}
    
    func what()
}

protocol ConsolePrintable: CustomStringConvertible {
    func printDescription()
}

extension Car {
    mutating func openWindow() {
        isWindow = Window.open
    }
    mutating func closeWindow() {
        isWindow = Window.close
    }
    
    mutating func runEngine() {
        isEngine = Engine.run
    }
    mutating func drownEngine() {
        isEngine = Engine.drown
    }
}

class TruckCar: Car, ConsolePrintable {
    var mark: String
    var yearIssue: Int
    var capLuggage: Int
    var isEngine: Engine
    var isWindow: Window
    var isLuggage: Luggage
    
    var tonnage: Int
    
    required init(mark: String, yearIssue: Int, capLuggage: Int, isEngine: Engine, isWindow: Window, isLuggage: Luggage, tonnage: Int) {
        self.mark = mark
        self.yearIssue = yearIssue
        self.capLuggage = capLuggage
        self.isEngine = isEngine
        self.isWindow = isWindow
        self.isLuggage = isLuggage
        self.tonnage = tonnage
    }
    
    func what(){
        print("Грузовик")
    }
    
    func printDescription() {
        print(description)
    }
    
    var description: String {
        return String(describing: tonnage)
    }
    
}

class SportCar: Car, ConsolePrintable {
    var mark: String
    var yearIssue: Int
    var capLuggage: Int
    var isEngine: Engine
    var isWindow: Window
    var isLuggage: Luggage
    
    var trailer: Bool
    
    required init(mark: String, yearIssue: Int, capLuggage: Int, isEngine: Engine, isWindow: Window, isLuggage: Luggage, trailer: Bool) {
        self.mark = mark
        self.yearIssue = yearIssue
        self.capLuggage = capLuggage
        self.isEngine = isEngine
        self.isWindow = isWindow
        self.isLuggage = isLuggage
        self.trailer = false
    }
    
    func what(){
        print("Легковая")
    }
    
    func printDescription() {
        print(description)
    }
    
    var description: String {
        return String(describing: isWindow.rawValue)
    }
}


var truck1 = TruckCar (mark: "Mitsubishi", yearIssue: 2010, capLuggage: 600, isEngine: .run, isWindow: .close, isLuggage: .empty, tonnage: 40)
var car1 = SportCar (mark: "Hyundai", yearIssue: 2015, capLuggage: 510, isEngine: .drown, isWindow: .close, isLuggage: .full, trailer: false)
var car2 = SportCar (mark: "Lexus", yearIssue: 2017, capLuggage: 570, isEngine: .drown, isWindow: .open, isLuggage: .medium, trailer: true)

print(truck1.isEngine.rawValue)
truck1.drownEngine()
print(truck1.isEngine.rawValue)

truck1.printDescription()

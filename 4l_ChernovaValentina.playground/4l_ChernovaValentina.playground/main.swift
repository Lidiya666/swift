import Foundation

enum Engine: String {
    case run = "двигатель запущен", drown = "двигатель остановлен"
}

enum Window: String {
    case open = "окна открыты", close = "окна закрыты"
}

enum Luggage: String {
    case full = "Полный багажник"
    case medium = "Полупустой багажник"
    case empty = "Пустой багажник"
}

enum bodyType: String {
    case euroTruck = "Еврофура"
    case autoCoupling = "Автосцепка"
}

enum roofRack: String {
    case bicycleTrunk = "Велосипедный багажник"
    case autobox = "Автобокс"
    case notValue = "Без доп.багажника"
}

class Car {
    var mark: String
    var yearIssue: Int
    var capLuggage: Int
    var isEngine: Engine
    var isWindow: Window
    var isLuggage: Luggage
    
    init(mark: String, yearIssue: Int, capLuggage: Int, isEngine: Engine, isWindow: Window, isLuggage: Luggage) {
        self.mark = mark
        self.yearIssue = yearIssue
        self.capLuggage = capLuggage
        self.isEngine = isEngine
        self.isWindow = isWindow
        self.isLuggage = isLuggage
    }
    
    func what(){
        print("Автомобиль")
    }
}

class trunkCar: Car{
    var isBodyType: bodyType
    var tonnage: Int
    
    init(mark: String, yearIssue: Int, capLuggage: Int, isEngine: Engine, isWindow: Window, isLuggage: Luggage, isBodyType: bodyType, tonnage: Int) {
        self.isBodyType = isBodyType
        self.tonnage = tonnage
        super.init(mark: mark, yearIssue: yearIssue, capLuggage: capLuggage, isEngine: isEngine, isWindow: isWindow, isLuggage: isLuggage)
    }
    
    override func what() {
        print("Грузовик")
    }
}

class sportCar: Car {
    var isRoofRack: roofRack
    var trailer: Bool
    
    init(mark: String, yearIssue: Int, capLuggage: Int, isEngine: Engine, isWindow: Window, isLuggage: Luggage, isRoofRack: roofRack, trailer: Bool) {
        self.isRoofRack = isRoofRack
        self.trailer = trailer
        super.init(mark: mark, yearIssue: yearIssue, capLuggage: capLuggage, isEngine: isEngine, isWindow: isWindow, isLuggage: isLuggage)
    }
    
    override func what() {
        print("Легковушка")
    }
}

var cars = [Car]()

var car1 = sportCar (mark: "Hyundai", yearIssue: 2015, capLuggage: 510, isEngine: .drown, isWindow: .close, isLuggage: .full, isRoofRack: .autobox, trailer: false)
var car2 = sportCar (mark: "Lexus", yearIssue: 2017, capLuggage: 570, isEngine: .drown, isWindow: .open, isLuggage: .medium, isRoofRack: .notValue, trailer: true)
var truck1 = trunkCar (mark: "Mitsubishi", yearIssue: 2010, capLuggage: 600, isEngine: .run, isWindow: .close, isLuggage: .empty, isBodyType: .euroTruck, tonnage: 15)

cars.append(car1)
cars.append(car2)
cars.append(truck1)

for car in cars{
    car.what()
    print("\(car.mark) - \(car.yearIssue) года выпуска - \(car.capLuggage)л - \(car.isEngine.rawValue) - \(car.isWindow.rawValue) - \(car.isLuggage.rawValue)")
    if car is sportCar {
        print("вид доп.багажника: \((car as? sportCar)?.isRoofRack.rawValue) - трейлер: \((car as? sportCar)?.trailer)")
    } else {
        print("вид кузова: \((car as? trunkCar)?.isBodyType.rawValue) - тоннаж: \((car as? trunkCar)?.tonnage)")
    }
}

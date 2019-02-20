import Foundation

enum BettingError: Error {
    case nameSelection          //данная команда не играла
    case winSelection           //не верно выбран проигрыш/выиграш
    case ratingSelection        //кол-во очков не верно
}


// таблица сыгранных игр
struct TableSucces {
    var name: String            //название команды
    var win: String             //проигрыш или выигрыш
    var point: Int              //кол-во набранных очков
    var rate: Int               //ставка
}

// список делающих ставки на команды
let favoriteCommand = [
    ["Александр","ЦСКА", "победа", 4, 1000],
    ["Елена","Динамо", "победа", 4, 1000],
    ["Андрей", "Зенит", "проигрыш", 4, 1000],
    ["Саша", "Рубин", "проигрыш", 4, 1000]
]

class Betting {
    // Хранилище
    var values = [
        "Зенит": TableSucces(name: "Зенит", win: "победа", point: 3, rate: 2),
        "ЦСКА": TableSucces(name: "ЦСКА", win: "победа", point: 1, rate: 3),
        "Спартак": TableSucces(name: "Спартак", win: "проигрыш", point: 2, rate: 4),
        "Динамо": TableSucces(name: "Динамо", win: "победа", point: 4, rate: 5)
    ]
    
    // помечаем метод как «throws», это означает, что он может завершиться с ошибкой
    func comm(person: String, commNamed name: String, winner: String, points: Int, coinsDeposited: Int) throws {
        print("\(person): ")
        
        // Если нет такой команды
        guard let item = values[name] else {
            // генерируем ошибку
            throw BettingError.nameSelection
        }
        // если ошибка в выигрыше
        guard item.win == winner else {
            // генерируем ошибку
            throw BettingError.winSelection
        }
        // ошибка в количестве предпологаемых выигранных очков
        guard item.point == points else {
            // генерируем ошибку
            throw BettingError.ratingSelection
        }
        // продаем товар
        let winSum = coinsDeposited * item.rate
        
        print(winSum)
    }
}

for i in 0...favoriteCommand.count-1 {
    do {
        _ = try Betting().comm(person: favoriteCommand[i][0] as! String, commNamed: favoriteCommand[i][1] as! String, winner: favoriteCommand[i][2] as! String, points: favoriteCommand[i][3] as! Int, coinsDeposited: favoriteCommand[i][4] as! Int)
    } catch BettingError.nameSelection {
        print("Данная команда еще не играла")
    } catch BettingError.winSelection {
        print("Вы ошиблись со статусом победы/проигрыша")
    } catch BettingError.ratingSelection {
        print("Количество очков не верно")
    } catch let error {
        // если во время выполнения возникла ошибка, обрабатываем ее
        print(error.localizedDescription)
    }
}

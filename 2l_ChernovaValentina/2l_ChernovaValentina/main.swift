import Foundation

var num: Int = 6 // число для первой и второй функции

//1. функция, которая определяет четность числа

func evenElem(_ num: Int) -> Bool {
    let ans: Bool = num % 2 == 0 ? true : false
    return ans
}

print("Четное ли число: \(num)? \(evenElem(num))")
print("/////////////////////////")

//2. функция, которая определяет делимость на три

func thrDivide(_ num: Int) -> Bool {
    let ans1: Bool = num % 3 == 0 ? true : false
    return ans1
}

print("Делится ли на 3 число: \(num)? \(thrDivide(num))")
print("/////////////////////////")

//3. Создать возрастающий массив из 100 чисел.

var hunArr = [Int]()
for i: Int in 1...100{
    hunArr.append(i)
}

/*print(hunArr) - отобразите по необходимости
 print("/////////////////////////")*/

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for j in stride (from: hunArr.count-1, through: 0, by: -1){
    if (thrDivide(hunArr[j]) || evenElem(hunArr[j])){ //пробовала через две функции выше, но что то не пошло, либо четные удалял, либо на 3 деленые, вместе не учитывал функции
        hunArr.remove(at: j)
    }
}
print("\(hunArr), кол-во элементов массива: \(hunArr.count)")
print("/////////////////////////")

//5. Числа Фибоначчи до 92 элемента

var numFib = [0,1]
for i: Int in 2...92{
    numFib.append(numFib[i-1]+numFib[i-2])
}
/*print(numFib) - отобразите по необходимости
 print("/////////////////////////")*/

//6. Составить массив простых чисел до 100 элементов

func fillingArray(_array: Array<Int>, l: Int) -> (Array<Int>, i: Int){
    for i in l...l+10{
        fillArr.append(i)
    }
    let i: Int = l+10
    return (fillArr, i)
}

func clearArray(_array: Array<Int>, I: Int) -> Array<Int>{
    let p: Int = fillArr[I]
    for z in stride (from: fillArr.count-1, through: 1+I, by: -1){
        if (fillArr[z] % p == 0){
            fillArr.remove(at: z)
        }
    }
    return fillArr
}

var fillArr = [Int]()
var i: Int = 2

repeat{
    var j: Int = 0
    let fill = fillingArray(_array: fillArr, l: i)
    fillArr = fill.0
    i = fill.1
    repeat{
        fillArr = clearArray(_array: fillArr, I: j)
        j += 1
    } while fillArr.count > j
} while fillArr.count < 100

print("\(fillArr), кол-во элементов массива: \(fillArr.count)")

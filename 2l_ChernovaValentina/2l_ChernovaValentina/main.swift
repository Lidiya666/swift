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
    if (thrDivide(hunArr[j]) || evenElem(hunArr[j])){
        hunArr.remove(at: j)
    }
}
print("\(hunArr), кол-во элементов массива: \(hunArr.count)")
print("/////////////////////////")

//5. Числа Фибоначчи до 92 элемента

var numFib: [Double] = [0,1]
for i: Int in 2...100{
    numFib.append(numFib[i-1]+numFib[i-2])
}
//print(numFib) - отобразите по необходимости
//print("/////////////////////////")

//6. Составить массив простых чисел до 100 элементов

var fillArr = [Int]()
var i: Int = 2
let N: Int = 200

func fillingArray(array: inout Array<Int>, l: Int) -> (_array: Array<Int>, l: Int){
    for i in l...l+2{
       array.append(i)
    }
    let i: Int = l+2
    return (array, i)
}

func clearArray(array: inout Array<Int>, I: Int) -> Array<Int>{
    let p: Int = array[I]
    for z in stride (from: array.count-1, through: 1+I, by: -1){
        if (array[z] % p == 0){
            array.remove(at: z)
        }
    }
    return array
}

repeat{
    var j: Int = 0
    let fill = fillingArray(array: &fillArr, l: i)
    fillArr = fill.0
    i = fill.1
    repeat{
        fillArr = clearArray(array: &fillArr, I: j)
        j += 1
    } while fillArr.count > j
} while fillArr.count < N

print("\(fillArr), кол-во элементов массива: \(fillArr.count)")

import UIKit

var numbersArray: [Int] = []
for _ in 1...10 {
    numbersArray.append(Int.random(in: -10...10))
}


//MARK: Task 1

for (index, value) in numbersArray.enumerated() {
    if value < 0 {
        numbersArray[index] = 0
    }
}

//print(numbersArray)


//MARK: Task 2

var minNumber = 0
var maxNumber = 0

for number in numbersArray {
    if number < minNumber {
        minNumber = number
    }
    if number > maxNumber {
        maxNumber = number
    }
}

//print("Minimum element: \(minNumber)")
//print("Maximum element: \(maxNumber)")


//MARK: Task 3

var sumOfArrayElements = 0

for number in numbersArray {
    sumOfArrayElements += number
}

//print(sumOfArrayElements)


//MARK: Task 4

let monthsArray = ["January", "Febrary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

var monthsDictionary: [Int: String] = [:]

for (index, month) in monthsArray.enumerated() {
    monthsDictionary[index] = month
}


//MARK: Task 5

var dictionary = ["first": 1, "second": 2, "third": 3, "fourth": 4]

for i in dictionary {
    if i.key == "first" {
        dictionary["first"] = dictionary["fourth"]
    }
}
dictionary.updateValue(1, forKey: "fourth")

//print(dictionary)


//MARK: Task 6

var calendar: [Int: [String]] = [:]
let rangeOfYears = 1970...2022

for index in rangeOfYears {
    calendar[index] = monthsArray
}


//MARK: Task 7

for index in rangeOfYears {
    
    var array = calendar[index] ?? []
    array.append("NameOfMyMonth")
    
    calendar[index] = array
}


//MARK: Task 7.1

let rangeOfDays = 1...31

var daysArray: [Int] = []
var valuesForEachYear: [String: [Int]] = [:]
var calendarPro: [Int: [String: [Int]]] = [:]

for day in rangeOfDays {
    daysArray.append(day)
}

for month in monthsArray {
    valuesForEachYear[month] = daysArray
}

for index in rangeOfYears {
    calendarPro[index] = valuesForEachYear
}

//print(calendarPro[2019]?["September"]?[0])


//MARK: Task 8

var firstNum = Int.random(in: -10...10)
var secondNum = Int.random(in: -10...10)

let sum = firstNum + secondNum

if firstNum == secondNum {
    print(sum * 3)
} else if sum % 2 == 0 {
    print(sum)
}


//MARK: Task 9

let primaryString = "Hello, Swift Playground!"
let primaryStringWithoutExclamationMark = primaryString.dropLast()

let wordsArray = primaryStringWithoutExclamationMark.components(separatedBy: " ")

//print(wordsArray.first)
//print(wordsArray.last)

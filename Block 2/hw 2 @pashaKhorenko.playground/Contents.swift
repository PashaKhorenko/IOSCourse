import Foundation

//MARK: - Task 1

class Sailor {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func introduceMyself() {
        print("Привіт, мене звуть \(name)!")
    }
}


//MARK: - Task 2

class Ship {
    let name: String
    let sailorsArray: [Sailor]
    
    init(name: String, sailorsArray: [Sailor]) {
        self.name = name
        self.sailorsArray = sailorsArray
    }
    
    func introduceAll() {
        for sailor in sailorsArray {
            sailor.introduceMyself()
        }
        
        print("Ми з корабля \(name).")
    }
}


//MARK: - Task 3

let firstSailor = Sailor(name: "Петро")
let secondSailor = Sailor(name: "Микола")
let thirdSailor = Sailor(name: "Василь")
let fourthSailor = Sailor(name: "Іван")
let fifthSailor = Sailor(name: "Ярослав")

let array = [firstSailor, secondSailor, thirdSailor, fourthSailor, fifthSailor]

let testShip = Ship(name: "testShipName", sailorsArray: array)

//testShip.introduceAll()


//MARK: - Task 4

class TitanicSailor: Sailor {
    override func introduceMyself() {
        print("Hello, my name is \(name)!")
    }
}

class Titanic: Ship {
    override func introduceAll() {
        super.introduceAll()
        
        print("We are from the ship \(name).")
    }
}

let firstTitanicSailor = TitanicSailor(name: "Jack")
let secondTitanicSailor = TitanicSailor(name: "Kevin")
let thirdTitanicSailor = TitanicSailor(name: "Fred")
let fourthTitanicSailor = TitanicSailor(name: "Harry")
let fifthTitanicSailor = TitanicSailor(name: "Ethan")

let titanicSailorArray: [Sailor] = [firstTitanicSailor, secondTitanicSailor, thirdTitanicSailor, fourthTitanicSailor, fifthTitanicSailor]

let titanic = Titanic(name: "Titanic", sailorsArray: titanicSailorArray)

//titanic.introduceAll()


//MARK: - Task 5

class Calculator {
    func add(_ num1: Double, to num2: Double) -> Double {
        num1 + num2
    }
    
    func subtract(_ num1: Double, from num2: Double) -> Double {
        num2 - num1
    }
    
    func multiply(_ num1: Double, by num2: Double) -> Double {
        num1 * num2
    }
    
    func divide(_ num1: Double, by num2: Double) -> Double {
        if num2 != 0 {
            return num1 / num2
        }
        return 0.0
    }
}

let sum = Calculator().add(5, to: 5)
let difference = Calculator().subtract(4, from: 10)
let product = Calculator().multiply(4, by: 3)
let fraction = Calculator().divide(6, by: 2)


class CalculatorPro {
    func procent(_ procent: Double, from num: Double) -> Double {
        num / 100 * procent
    }
    
    func degree(_ num1: Double, in num2: Double) -> Double {
        Double(pow(num1, num2))
    }
}

let procent = CalculatorPro().procent(10, from: 12)
let degree = CalculatorPro().degree(3, in: 2)


//MARK: - Task 5.1

class SuperProCalc: CalculatorPro {
    func compoundInterest(initialAmount a: Double, interest p: Double, numberOfMonths n: Double) -> Double {
        a * pow((1 + p/100), n / 12)
    }
}

let finalAmount = SuperProCalc().compoundInterest(initialAmount: 1000,
                                                  interest: 5,
                                                  numberOfMonths: 12)


//MARK: - Task 6

class Car {
    enum wheelDriveEnum {
        case Front
        case Posterior
        case Full
    }
    
    let brand: String
    let model: String
    var maxSpeed: Int
    var clearance: Int
    let wheelDrive: wheelDriveEnum
    
    init(brand: String, model: String, maxSpeed: Int, clearance: Int, wheelDrive: wheelDriveEnum) {
        self.brand = brand
        self.model = model
        self.maxSpeed = maxSpeed
        self.clearance = clearance
        self.wheelDrive = wheelDrive
    }
    
    func beepBeep() {
        print("The \(brand) \(model) is honking!!!")
    }
    
    func drive() {
        print("The \(brand) \(model) is moving forward.")
    }
}

class CityHatchback: Car {
    override func drive() {
         print("The \(brand) \(model) moves through the streets of the city.")
    }
}

class OffroadCar: Car {
    override func drive() {
        print("The \(brand) \(model) moves through mud and huge hills.")
    }
}

class SportCar: Car {
    override func drive() {
        print("The \(brand) \(model) moves on the track with perfect coverage.")
    }
}

let testCar = Car(brand: "Tesla",
                  model: "Model 3",
                  maxSpeed: 220,
                  clearance: 150,
                  wheelDrive: .Posterior)

let cityHatchback = CityHatchback(brand: "Volkswagen",
                                  model: "Golf",
                                  maxSpeed: 180,
                                  clearance: 160,
                                  wheelDrive: .Front)

let offroadCar = OffroadCar(brand: "Land Rover",
                            model: "Defender",
                            maxSpeed: 150,
                            clearance: 310,
                            wheelDrive: .Full)

let sportCar = SportCar(brand: "Porsche",
                        model: "Cayman 718",
                        maxSpeed: 275,
                        clearance: 128,
                        wheelDrive: .Full)

testCar.beepBeep()
testCar.drive()

cityHatchback.beepBeep()

cityHatchback.drive()
offroadCar.drive()
sportCar.drive()


//MARK: - Task 7

let percentage = Int.random(in: 0...100)

func messageFromBattery(percentage: Int) {
    var message = ""
    
    switch percentage {
    case 100:
        message = "The device is charged."
    case 70...80:
        message = "It is necessary to charge the device within 6 hours."
    case 20...40:
        message = "Put the device on the charger."
    case 0:
        message = "The device is completely discharged."
    default:
        message = ""
    }
    
    print(message)
}

messageFromBattery(percentage: percentage)

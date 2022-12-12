import Foundation

//MARK: Task 1
//MARK: Protocols

protocol Movable {
    func run()
}

protocol Fightable {
    func fight()
}

protocol Hero: Movable, Fightable {
    var name: String { get set }
}

//MARK: Character types

struct Farmer: Movable {
    func run() {
        print("Farmer: Run")
    }
}

struct Blacksmith: Movable {
    func run() {
        print("Blacksmith: Run")
    }
}

struct Robber: Fightable {
    func fight() {
        print("Robber: Fight")
    }
}

struct Butcher: Fightable {
    func fight() {
        print("Butcher: Fight")
    }
}

struct Sheriff: Hero {
    var name: String
    
    func run() {
        print("Sheriff \(name): Run")
    }
    
    func fight() {
        print("Sheriff \(name): Fight")
    }
}

struct Mayor: Hero {
    var name: String
    
    func run() {
        print("Mayor \(name): Run")
    }
    
    func fight() {
        print("Mayor \(name): Fight")
    }
}

//MARK: Tavern

class Tavern {
    
    var movers: [Movable] = []
    var fighters: [Fightable] = []
    
    func enterTavern(hero: Hero) {
        hero.fight()
        
        for mover in movers {
            mover.run()
        }
        
        for fighter in fighters {
            fighter.fight()
        }
    }
}


//MARK: Testing

let farmer = Farmer()
let blacksmith = Blacksmith()

let robber = Robber()
let butcher = Butcher()

let sheriff = Sheriff(name: "Bob")
let mayor = Mayor(name: "Tom")

let arrayOfMovingPersonage: [Movable] = [farmer, blacksmith]
let arrayOfFightingPersonage: [Fightable] = [robber, butcher]

var tavern = Tavern()
tavern.movers = arrayOfMovingPersonage
tavern.fighters = arrayOfFightingPersonage

//tavern.enterTavern(hero: sheriff)
//tavern.enterTavern(hero: mayor)


//MARK: - Task 3

extension Int {
    func power(_ index: Int) -> Int {
        var result = 1
        var powerNum = index
        var tempExpo = self
        
        while powerNum != 0 {
            
            if powerNum % 2 == 1 {
                result *= tempExpo
            }
            
            powerNum /= 2
            tempExpo *= tempExpo
        }
        
        return result
    }
}

-5.power(2)
8.power(0)
10.power(3)


extension String {
    var isPalindrome: Bool {
        let word = self.lowercased()
            .components(separatedBy: .punctuationCharacters).joined()
            .components(separatedBy: .whitespacesAndNewlines).joined()
//        print(word)
        return word == String(word.reversed())
    }
}

let firstTestString = "Я несу гусеня"
firstTestString.isPalindrome

let secondTestString = "Кажи хижак!"
secondTestString.isPalindrome

let thirdTestString = "12f34 5! 43B21"
thirdTestString.isPalindrome


//MARK: - Task 5

var first = 5
var second = 10

func change<T>(_ a: inout T, to b: inout T) {
    let c = a
    a = b
    b = c
}

change(&first, to: &second)

//MARK: -

func createTuple<T>(with a: T, _ b: T) -> (T, T) {
    (a, b)
}

createTuple(with: first, second)

//MARK: -

func sumOf<T: Numeric>(_ a: T, _ b: T) -> T {
    a + b
}

sumOf(first, second)

//MARK: -

struct MyType<T> {
    var dictionary: [Int: T]
    
    mutating func appendValue(_ value: T, forKey key: Int) {
        dictionary[key] = value
    }
    
    func giveValue(forKey key: Int) -> T {
        guard let value = dictionary[key] else {
            fatalError("Value for key \(key) does not exist.")
        }
        return value
    }
}

let testDictionary: [Int: Any] = [:]
var test = MyType(dictionary: testDictionary)

test.appendValue("zero", forKey: 0)
test.appendValue(1, forKey: 1)

test.giveValue(forKey: 0)
//test.giveValue(forKey: 5)


//MARK: - Task 6

struct Stack<T> {
    private var items: [T] = []
    
    func peek() -> T {
        guard let topElement = items.first else {
            fatalError("This stack is empty.")
        }
        return topElement
    }
    
    mutating func pop() -> T {
        return items.removeFirst()
    }
  
    mutating func push(_ element: T) {
        items.insert(element, at: 0)
    }
}


var testIntStack = Stack<Int>()

testIntStack.push(5)
testIntStack.push(10)
testIntStack.peek()
testIntStack.pop()
testIntStack.peek()
testIntStack.pop()

var testStringStack = Stack<String>()

testStringStack.push("5")
testStringStack.push("10")
testStringStack.peek()
testStringStack.pop()
testStringStack.peek()
testStringStack.pop()

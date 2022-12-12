import Foundation

//MARK: - Task 1.1

enum Seasons: String {
    case winter = "Winter"
    case spring = "Spring"
    case summer = "Summer"
    case autumn = "Autumn"
}

let winter: Seasons = .winter
let autumn = Seasons.autumn

winter.rawValue
autumn.rawValue

//MARK: - Task 1.2

enum MonthsOfYear {
    case january, february, march, april, may, june, july, august, september, october, november, december
}

func numberOfMonth(_ item: MonthsOfYear) -> Int {
    switch item {
    case .january: return 1
    case .february: return 2
    case .march: return 3
    case .april: return 4
    case .may: return 5
    case .june: return 6
    case .july: return 7
    case .august: return 8
    case .september: return 9
    case .october: return 10
    case .november: return 11
    case .december: return 12
    }
}

let may: MonthsOfYear = .may
let june = MonthsOfYear.june

numberOfMonth(may)
numberOfMonth(june)
numberOfMonth(.october)

//MARK: - Task 1.3

enum Pizza {
  case small(diameter: Int)
  case medium(diameter: Int)
  case large(diameter: Int)
}

func verdictFor(pizza: Pizza) -> String {
    switch pizza {
    case .small(let diameter):
        return "Small pizza diameter: \(diameter). Still, it is too small."
    case .medium(let diameter):
        return "Medium pizza diameter: \(diameter). What everyone really needs!"
    case .large(let diameter):
        return "Large pizza diameter: \(diameter). Suitable for two people."
    }
}

let smallPizza: Pizza = .small(diameter: 30)
let mediumPizza: Pizza = .medium(diameter: 35)
let largePizza: Pizza = .large(diameter: 40)

verdictFor(pizza: smallPizza)
verdictFor(pizza: mediumPizza)
verdictFor(pizza: largePizza)


//MARK: - Task 2

enum VehicleType {
    case electric, nonElectric
}

protocol Vehicle {
    var weight: Float { get }
    var speed: Float { get }
    var type: VehicleType { get }
    var canFly: Bool { get }
    
    func prepare()
}

extension Vehicle {
    var canFly: Bool {
        return false
    }
    
    func prepare() {
        switch type {
        case .electric: print("Charge")
        case .nonElectric: print("Refuel")
        }
    }
}

protocol FlyableVehicle: Vehicle {
    func getMaxHight() -> Float
}

extension Vehicle where Self: FlyableVehicle {
    var canFly: Bool {
        return true
    }
    var type: VehicleType {
        return .nonElectric
    }

    func getMaxHight() -> Float {
        switch type {
        case .electric: return weight + speed
        case .nonElectric: return weight * speed
        }
    }
}

struct Car: Vehicle {
    var weight: Float
    var speed: Float
    var type: VehicleType
}

struct ElectricCar: Vehicle {
    var weight: Float
    var speed: Float
    var type: VehicleType
}

struct AirPlane: FlyableVehicle {
    var weight: Float
    var speed: Float
}


let car: Car = Car(weight: 1.2, speed: 150, type: .nonElectric)
let electricCar: ElectricCar = ElectricCar(weight: 1.7, speed: 180, type: .electric)
let airPlane: AirPlane = AirPlane(weight: 2.5, speed: 500)

print("Car type: \(car.type), canFly: \(car.canFly).")
print("ElectricCr type: \(electricCar.type), canFly: \(electricCar.canFly).")
print("AirPlane type: \(airPlane.type).")
airPlane.getMaxHight()


struct ElectricalAirplane: FlyableVehicle {
    var weight: Float
    var speed: Float
    var type: VehicleType
}

let electricalAirplane = ElectricalAirplane(weight: 2.5, speed: 500, type: .electric)

electricalAirplane.getMaxHight()


//MARK: - Task 3 - 4
// https://github.com/PashaKhorenko/Protocol-Practice

//MARK: - Task 5

// Вже ніби виконав.

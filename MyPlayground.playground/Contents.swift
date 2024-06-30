//1
class Car {
    var Brand: String
    var Model: String
    var ManufactureYear: Int
    var Cost: Double
    
    init(Brand: String, Model: String, ManufactureYear: Int, Cost: Double){
        self.Brand = Brand
        self.Model = Model
        self.ManufactureYear = ManufactureYear
        self.Cost = Cost
    }
    
    func PrintCarInfo() {
        print("\(Brand) \(Model) \(ManufactureYear) года выпуска. Стоимость: \(Cost)")
    }
    func GetCarInfo() -> String{
        return "\(self.Brand) \(self.Model)"
    }
}
//2
class Crossover: Car {
    var groundClearance: Double

    init(Brand: String, Model: String, ManufactureYear: Int, Cost: Double, groundClearance: Double) {
        self.groundClearance = groundClearance
        super.init(Brand: Brand, Model: Model, ManufactureYear: ManufactureYear, Cost: Cost)
    }
}

class Sedan: Car {
    var luxury: Bool

    init(Brand: String, Model: String, ManufactureYear: Int, Cost: Double, luxury: Bool) {
        self.luxury = luxury
        super.init(Brand: Brand, Model: Model, ManufactureYear: ManufactureYear, Cost: Cost)
    }
}

class Waggon: Car {
    var baggageVolume: Int

    init(Brand: String, Model: String, ManufactureYear: Int, Cost: Double, baggageVolume: Int) {
        self.baggageVolume = baggageVolume
        super.init(Brand: Brand, Model: Model, ManufactureYear: ManufactureYear, Cost: Cost)
    }
}

class Hatchback: Car {
    var weight: Int

    init(Brand: String, Model: String, ManufactureYear: Int, Cost: Double, weight: Int) {
        self.weight = weight
        super.init(Brand: Brand, Model: Model, ManufactureYear: ManufactureYear, Cost: Cost)
    }
}

//3
func ManufactureCar(brand: String, model: String, manufactureYear: Int, cost:Double) -> Car {
    return Car(Brand: brand, Model: model, ManufactureYear: manufactureYear, Cost: cost)
}

//4
func makeRun(firstCar: Car, secondCar: Car) -> Car{
    var winner = firstCar.Cost >= secondCar.Cost ? firstCar : secondCar
    return winner
}

//5
var cars: [Car] = []
cars.append(ManufactureCar(brand: "vw", model: "golf", manufactureYear: 2018, cost: 22854))
cars.append(ManufactureCar(brand: "skoda", model: "octavia", manufactureYear: 2012, cost: 12222))
cars.append(ManufactureCar(brand: "seat", model: "leon", manufactureYear: 2007, cost: 8635))
cars.append(ManufactureCar(brand: "audi", model: "a3", manufactureYear: 2022, cost: 31098))

var statistics: Dictionary<String, Int> = [:]
for car in cars {
    statistics[car.GetCarInfo()] = 0
    for opponent in cars{
        if car.Cost.isEqual(to: opponent.Cost){
            continue
        }
        if car.Cost > opponent.Cost{
            statistics[car.GetCarInfo()]! += 1
            print("\(car.GetCarInfo()) одержал победу над \(opponent.GetCarInfo())")
        }
    }
}


var maxwins: Int = 0
var winners: [String] = []

for (carInfo, wins) in statistics {
    if wins > maxwins {
        maxwins = wins
        winners = [carInfo]
    } 
    else if wins == maxwins {
        winners.append(carInfo)
    }
}

if winners.count == 1 {
    print("По итогам всех встреч первое место занимает \(winners[0]) с числом побед: \(maxwins)")
}
else {
    print("Ничья между:")
    for winner in winners {
        print(winner)
    }
}



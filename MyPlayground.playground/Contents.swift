class Car {
    var Brand : String
    var Model : String
    var ManufactureYear : Int
    var Cost : Double
    
    init(Brand : String, Model : String, ManufactureYear : Int, Cost : Double){
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
//
class Crossover : Car {
    var groundСlearance : Double = 1
}

class Sedan : Car {
    var luxury : Bool = false
}

class Waggon : Car {
    var baggageVolume:Int = 1
}
class Hatchback : Car {
    var weight:Int = 1
}
//
func ManufactureCar(brand : String, model:String, manufactureYear:Int, cost:Double) -> Car {
    return Car(Brand:brand, Model:model, ManufactureYear:manufactureYear, Cost:cost)
}

//
func makeRun(firstCar : Car, secondCar : Car) -> Car{
    var winner = firstCar.Cost >= secondCar.Cost ? firstCar : secondCar
    return winner
}

//
var cars : [Car] = []
cars.append(ManufactureCar(brand: "vw", model: "golf", manufactureYear: 2018, cost: 22854))
cars.append(ManufactureCar(brand: "skoda", model: "octavia", manufactureYear: 2012, cost: 12222))
cars.append(ManufactureCar(brand: "seat", model: "leon", manufactureYear: 2007, cost: 8635))
cars.append(ManufactureCar(brand: "audi", model: "a3", manufactureYear: 2022, cost: 31098))

while cars.count > 1{
    for i in 1..<cars.count/2{
        var winner = makeRun(firstCar: cars[i-1-i+1], secondCar: cars[i*2-1-i+1])
        print("\(winner.GetCarInfo()) победил в долларовой схватке против \(cars[i*2-1].GetCarInfo())")
        cars.remove(at: i*2-1-i+1)
    }
}

print("Победитель")
cars[0].PrintCarInfo()

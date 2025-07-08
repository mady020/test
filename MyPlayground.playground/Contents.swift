struct Size{
    var width: Double
    var height: Double
    func area() -> Double{
        return width * height
    }
    func printArea(){
        print("Area is: \(area())")
    }
    init(_ width: Double, _ height: Double) {
        self.width = width
        self.height = height
    }
}

var size =  Size(12,10)
size.printArea()


struct Car{
    var odoMeter: Int
    var speed: Int
    var isRunning:Bool = false
    var isStarted:Bool = false
    init(_ odoMeter:Int, _ speed:Int){
        self.odoMeter = odoMeter
        self.speed = speed
    }
    func printCarStatus(){
        print("The car's speed is \(speed) Km/h and the odoMeter is \(odoMeter) KM")
    }
    mutating func startEngine(){
        print("Engine started")
        isStarted = true
    }
    mutating func accelerate(){
        if !self.isStarted{
            print("Start the Car first!")
            return
        }
        isRunning = true
        self.speed += 10
    }
    mutating func decelerate(){
        if !self.isStarted{
            print("Start the Car first!")
            return
        }
        self.speed -= 10
    }
}

var car = Car(1000,410)
car.printCarStatus()
car.startEngine()
car.accelerate()
car.printCarStatus()
car.accelerate()
car.printCarStatus()
car.accelerate()
car.printCarStatus()
car.decelerate()
car.printCarStatus()


struct Temp{
    var celsius: Double{
        willSet{
            print("The value of celsius is going to get updated")
        }
        didSet{
            if celsius > oldValue{
                print("The temp is going up and day is becoming hot")
            }else{
                if celsius == oldValue{
                    print("Temp is unchanged!")
                }else{
                    print("The temp is going down and day is becoming cold")
                }
            }
        }
    }
    var fahrenheit: Double {
         (celsius - 32) * 1.8
    }
    var kelvin: Double {
         (celsius + 273.15)
    }
    init(c celsius: Double){
        self.celsius = celsius
    }
    func printTemp(){
        print("Celsius: \(celsius)")
        print("Fahrenheit: \(fahrenheit)")
        print("Kelvin: \(kelvin)")
    }
    mutating func tempUp(){
        self.celsius += 1
    }
    mutating func tempDown(){
        self.celsius -= 1
    }
}

var chitkaraTemp = Temp(c: 10)
chitkaraTemp.printTemp()
chitkaraTemp.tempUp()
chitkaraTemp.printTemp()

struct User{
    static var currentYear = 2025
    var firstName:String{
        didSet{
            print("First Name is  \(oldValue)")
        }
        willSet{
            print("First Name is changed to \(newValue)")
        }
    }
    var lastName:String{
        didSet{
            print("Last Name is  \(oldValue)")
        }
        willSet{
            print("Last Name is changed to \(newValue)")
        }
    }
    var fullName:String  {
        firstName + " " + lastName
    }
    var age:Int{
        didSet{
            print("Age is changing from  \(oldValue)")
        }
        willSet{
            print("Age is changed to \(newValue)")
        }
    }
    var birthYear:Int {
        User.currentYear - age
    }
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    func printDetails(){
        print("Full Name: \(fullName)")
        print("Year of Birth: \(birthYear)")
    }
}

var madhav = User(firstName: "Madhav", lastName: "Sharma", age: 20)
//madhav.printDetails()
//madhav.age = 21
//madhav.printDetails()


class Vehicle{
    var currentSpeed = 0.0
    var description:String {
        "travelling at \(currentSpeed) miles per hour"
    }
    func makenoise(){
        
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

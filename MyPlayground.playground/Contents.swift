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


//struct Car{
//    var odoMeter: Int
//    var speed: Int
//    var isRunning:Bool = false
//    var isStarted:Bool = false
//    init(_ odoMeter:Int, _ speed:Int){
//        self.odoMeter = odoMeter
//        self.speed = speed
//    }
//    func printCarStatus(){
//        print("The car's speed is \(speed) Km/h and the odoMeter is \(odoMeter) KM")
//    }
//    mutating func startEngine(){
//        print("Engine started")
//        isStarted = true
//    }
//    mutating func accelerate(){
//        if !self.isStarted{
//            print("Start the Car first!")
//            return
//        }
//        isRunning = true
//        self.speed += 10
//    }
//    mutating func decelerate(){
//        if !self.isStarted{
//            print("Start the Car first!")
//            return
//        }
//        self.speed -= 10
//    }
//}

//var car = Car(1000,410)
//car.printCarStatus()
//car.startEngine()
//car.accelerate()
//car.printCarStatus()
//car.accelerate()
//car.printCarStatus()
//car.accelerate()
//car.printCarStatus()
//car.decelerate()
//car.printCarStatus()


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
    init(currentSpeed: Double = 0.0) {
        self.currentSpeed = currentSpeed
    }
    var description:String {
        "travelling at \(currentSpeed) miles per hour"
    }
    func makeNoise() -> String{
        return "General Vehicle has no sound!"
    }
}

class Bicycle : Vehicle{
    var hasBasket = false
    init(currentSpeed: Double = 0.0 ,hasBasket: Bool = false) {
        self.hasBasket = hasBasket;
        super.init(currentSpeed: currentSpeed)
    }
     override func makeNoise() -> String {
         "trin trin"
    }
}
class Tandem: Bicycle{
    var currentNumberOfPassengers = 0
    init(currentSpeed: Double = 0.0 ,hasBasket: Bool = false, currentNumberOfPassengers: Int = 0) {
        self.currentNumberOfPassengers = currentNumberOfPassengers
        super.init(currentSpeed: currentSpeed, hasBasket: hasBasket)
    }
}
class Train: Vehicle{
     override func makeNoise() -> String {
         "Choo Choo"
    }
}

class Car: Vehicle{
    var gear = 1
    override var description: String {
        super.description + " in gear \(gear)"
    }
    override func makeNoise() -> String {
        "ratatata"
    }
}
var tandem = Tandem()
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 20
tandem.hasBasket = true

var car = Car()


var names: [String] = ["madhav", "navdeep", "harsh", "guri"]

if names.contains("madhav"){
    print("\(names) contains \(names[0])")
}
print("Total Number of Names: \(names.count)")

var numbers:[Int] = []

print(numbers.max() ?? Int.min)




// MARK: - Definition of a Struct (Value Type)

/// `pointStruct` is a value type. When you assign or pass it around,
/// Swift makes a full copy. Stored in the stack (usually).
struct pointStruct {
    var x: Int
    var y: Int
}

// MARK: - Definition of a Class (Reference Type)

/// `pointClass` is a reference type. Assignments or parameters share a reference,
/// not the actual object. Stored in the heap; the reference (pointer) is on the stack.
class pointClass {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

// MARK: - Struct Example (Value Semantics)

/// When `point1Ref` is assigned from `point1`, it's a full copy.
/// Both hold separate memory locations.
var point1 = pointStruct(x: 1, y: 2)
var point1Ref = point1

// Modify `point1Ref` and it won't affect `point1` because it's a deep copy
point1Ref.x = 100

// MARK: - Class Example (Reference Semantics)

/// Both `point2` and `point2Ref` point to the same object in memory.
var point2 = pointClass(x: 1, y: 2)
var point2Ref = point2

// Modify `point2Ref` and it affects `point2` as well
point2Ref.x = 100  // point2.x is now also 100

// MARK: - Inspecting Memory Layout Using UnsafeRawPointer

/// Get a raw pointer to the object memory.
/// This points to the start of the object in the heap.
var base = UnsafeRawPointer(Unmanaged.passUnretained(point2).toOpaque())

/// Get raw pointer to the `y` property inside the object.
/// Note: `withUnsafePointer` gives us a pointer to the stack address
/// of the property wrapper (not the heap), so we're measuring offset
/// from base to this.
let yPtr = withUnsafePointer(to: point2.y) {
    UnsafeRawPointer($0)
}

/// Same for the `x` property.
let xPtr = withUnsafePointer(to: point2.x) {
    UnsafeRawPointer($0)
}

/// Compute the byte offset of `y` relative to the object base pointer.
let offset = yPtr - base
print("Offset of point2.y is \(offset) Bytes")


var array:[[Int]] = []
array.append([1,2,3])
array.append([4,5,6])

//var array2 = Array<Array<Int>>()


for i in 0..<array.count{
    for j in 0..<array[0].count{
        print(array[i][j])
    }
}

var map = [
    0 : "madhav",
    1 : "harsh"
]

//var i = 0
//repeat{
//    print("hello \(i)")
//    i += 1
//}while i < 2
var i = 0
while i < 2 {
    print("hello \(i)")
    i += 1
}


var var1 = 1
var var2 = 1

print(withUnsafePointer(to: &var1){
  UnsafeRawPointer($0)
})
print(withUnsafePointer(to: &var2){
  UnsafeRawPointer($0)
})



for (index, letter) in "abcd".enumerated(){
    print("\(letter) at \(index)")
}

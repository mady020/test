/*:
## Exercise - Override Methods and Properties

 - Note: The exercises below are based on a game where a spaceship avoids obstacles in space. The ship is positioned at the bottom of a coordinate system and can only move left and right while obstacles "fall" from top to bottom. Throughout the exercises, you'll create classes to represent different types of spaceships that can be used in the game. The base class `Spaceship` and one subclass `Fighter` have been provided for you below.
 */
class Spaceship {
    var name: String = ""
    var health = 100
    var position = 0
    
    func moveLeft() {
        position -= 1
    }
    
    func moveRight() {
        position += 1
    }
    
    func wasHit() {
        health -= 5
        if health <= 0 {
            print("Sorry, your ship was hit one too many times. Do you want to play again?")
        }
    }
}

class Fighter: Spaceship {
    var weapon = ""
    var remainingFirePower = 5
    
    func fire() {
        if remainingFirePower > 0 {
            remainingFirePower -= 1
        } else {
            print("You have no more fire power.")
        }
    }
}
//:  Define a new class `ShieldedShip` that inherits from `Fighter`. Add a variable property `shieldStrength` that defaults to 25. Create a new instance of `ShieldedShip` called `defender`. Set `name` to "Defender" and `weapon` to "Cannon." Call `moveRight()` and print `position`, then call `fire()` and print `remainingFirePower`.
class ShieldedShip : Fighter{
    var shieldStrength = 25
    
}
let defender = ShieldedShip()
defender.name = "Defender"
defender.weapon = "Cannon"
defender.moveRight()
print("Defender's position is \(defender.position)")
defender.fire()
print("Defender's remaining power is \(defender.remainingFirePower)")
//:  When `shieldStrength` is 0, all `wasHit()` does is decrement `health` by 5. That's exactly what the implementation of `wasHit()` on `Spaceship` does! Instead of rewriting that, you can call through to the superclass implementation of `wasHit()`. Go back to your implementation of `wasHit()` on `ShieldedShip` and remove the code where you decrement `health` by 5 and replace it with a call to the superclass's implementation of the method. Call `wasHit()` on `defender`, then print `shieldStrength` and `health`.
defender.wasHit()
print("Defender's Shield Strength is \(defender.shieldStrength)")
print("Defender's   Health is \(defender.health)")
/*:
[Previous](@previous)  |  page 3 of 4  |  [Next: Exercise - Class Memberwise Initializers and References](@next)
 */

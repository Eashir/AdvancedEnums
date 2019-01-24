
protocol HealthBar {
	var numberOfHearts: Int { get }
	
	mutating func increaseHP()
	mutating func reduceHP()
}

enum Player: HealthBar {
	case dead
	case alive(currentHealth: Int)
	
	var numberOfHearts: Int {
		switch self {
		case .dead:
			return 0
		case let .alive(numberOfHearts):
			return numberOfHearts
		}
	}
	
	mutating func increaseHP() {
		switch self {
		case .dead:
			self = .alive(currentHealth: 1)
		case let .alive(numberOfHearts):
			self = .alive(currentHealth: numberOfHearts + 1)
		}
	}
	
	mutating func reduceHP() {
		switch self {
		case .dead:
			break
		case let .alive(numberOfHearts):
			if numberOfHearts == 1 {
				self = .dead
			} else {
				self = .alive(currentHealth: numberOfHearts - 1)
			}
		}
	}
	
}

var state = Player.dead.numberOfHearts

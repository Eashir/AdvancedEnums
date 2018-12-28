
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
	}
	
	mutating func reduceHP() {
		
	}
}

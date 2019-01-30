
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

var state = Player.dead
state.increaseHP()
state.numberOfHearts
state.increaseHP()
state.reduceHP()
state.reduceHP()
state.numberOfHearts




enum GameAction {
	case Start
	case Pause
	case Stop
	case Restart(delay: Int)
}

func ==(lhs: GameAction, rhs: GameAction) -> Bool {
	switch (lhs, rhs) {
	case (.Start, .Start), (.Pause, .Pause), (.Stop, .Stop):
		return true
	case let (.Restart(lhsDelay), .Restart(delay: rhsDelay)):
		return lhsDelay = rhsDelay
	default:
		return false
	}
}


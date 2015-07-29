//
//  DoubleLoop.swift
//  
//
//  Created by Evan Dekhayser on 7/29/15.
//
//

struct DoubleLoop<T: ForwardIndexType>: SequenceType{
	
	private let values: [ReturnTuple]
	
	typealias ReturnTuple = (T, T)
	
	init(r1: Range<T>, r2: Range<T>){
		var temp = [ReturnTuple]()
		for x in r1{
			for y in r2{
				temp.append((x,y))
			}
		}
		values = temp
	}
	
	typealias Generator = AnyGenerator<ReturnTuple>
	
	func generate() -> Generator {
		var index = 0
		
		return anyGenerator {
			defer{ index++ }
			if index < self.values.count{
				return self.values[index]
			}
			return nil
		}
	}
	
}

infix operator ∫ { associativity left precedence 134 }

func ∫ <T: ForwardIndexType>(left: Range<T>, right: Range<T>) -> DoubleLoop<T>{
	return DoubleLoop(r1: left, r2: right)
}

for (x,y) in 1..<5 ∫ 5...10{
	print("\(x) \(y)")
}

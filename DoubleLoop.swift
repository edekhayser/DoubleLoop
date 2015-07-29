//
//  DoubleLoop.swift
//  
//
//  Created by Evan Dekhayser on 7/29/15.
//
//

struct DoubleLoop<T: ForwardIndexType>: SequenceType{
	let firstRange: Range<T>
	let secondRange: Range<T>
	
	typealias ReturnTuple = (T, T)
	
	init(r1: Range<T>, r2: Range<T>){
		firstRange = r1
		secondRange = r2
	}
	
	typealias Generator = AnyGenerator<ReturnTuple>
	
	func generate() -> Generator {
		var index = 0
		
		return anyGenerator {
			defer{ index++ }
			var count = 0
			for x in self.firstRange{
				for y in self.secondRange{
					if count == index{
						return (x,y)
					}
					count++
				}
			}
			return nil
		}
	}
	
}

infix operator ∫ { associativity left precedence 134 }

func ∫ <T: ForwardIndexType>(left: Range<T>, right: Range<T>) -> DoubleLoop<T>{
	return DoubleLoop(r1: left, r2: right)
}


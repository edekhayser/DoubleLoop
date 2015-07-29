//
//  DoubleLoop.swift
//  
//
//  Created by Evan Dekhayser on 7/29/15.
//
//

struct DoubleLoop<T: ForwardIndexType>: SequenceType {
	let outerRange: Range<T>
	let innerRange: Range<T>
	
	init(_ outerRange: Range<T>, _ innerRange: Range<T>) {
		self.outerRange = outerRange
		self.innerRange = innerRange
	}
	
	typealias Generator = AnyGenerator<(T,T)>
	
	func generate() -> Generator {
		var x = self.outerRange.startIndex
		var y = self.innerRange.startIndex
		
		return anyGenerator {
			if x == self.outerRange.endIndex {
				return nil
			}
			
			let result = (x, y)
			
			++y
			if y == self.innerRange.endIndex {
				y = self.innerRange.startIndex
				++x
			}
			
			return result
		}
	}
}


infix operator ∫ { associativity left precedence 134 }

func ∫ <T: ForwardIndexType>(left: Range<T>, right: Range<T>) -> DoubleLoop<T>{
	return DoubleLoop(left, right)
}
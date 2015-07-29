//
//  DoubleLoop.swift
//  
//
//  Created by Evan Dekhayser on 7/29/15.
//
//

class DoubleLoop<T where T: Comparable, T: ForwardIndexType>: SequenceType{
	
	var firstRange: Range<T>
	var secondRange: Range<T>
	let copySecondRange: Range<T>
	
	typealias ReturnTuple = (T, T)
	
	init(r1: Range<T>, r2: Range<T>){
		firstRange = r1
		secondRange = r2
		copySecondRange = r2
	}
	
	typealias Generator = AnyGenerator<ReturnTuple>
	
	func generate() -> Generator {
		
		return anyGenerator {
			if self.secondRange.startIndex >= self.secondRange.endIndex{
				self.firstRange.startIndex++
				self.secondRange = self.copySecondRange
				if self.firstRange.startIndex >= self.firstRange.endIndex{
					return nil
				}
			}
			return (self.firstRange.startIndex, self.secondRange.startIndex++)
		}
	}
	
}

infix operator ∫ { associativity left precedence 134 }

func ∫ <T: ForwardIndexType>(left: Range<T>, right: Range<T>) -> DoubleLoop<T>{
	return DoubleLoop(r1: left, r2: right)
}



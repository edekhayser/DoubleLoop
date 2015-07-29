# DoubleLoop
Provides an easy way to loop through two ranges.

##Use Case##

When you have a for-loop within a for-loop, and want a simpler, more expressive way to write it:

```swift
for week in 1...10{
  for day in 1...7{
    print("\(week) \(day)")
  }
}
```

Using DoubleLoop:

```swift
for (week, day) in 1...10 ∫ 1...7{
  print("\(week) \(day)")
}
```

This is shorthand for the DoubleLoop initializer. You can also achieve the same goal using this code:

```swift
for (week, day) in DoubleLoop(1...10, 1...7){
  print("\(week) \(day)")
}
```

##Specifications##

DoubleLoop is written in Swift 2.0, and uses nothing but the Swift Standard Library.

To use DoubleLoop, simply drag **DoubleLoop.swift** into your project. 

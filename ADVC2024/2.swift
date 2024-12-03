//
//  Untitled.swift
//  ADVC2024
//
//  Created by Pablo Rodriguez on 2/12/24.
//

class p2 {
    
    static func parseTextIntoArrays(input: String) -> ([[Int]]) {
        let lines = input.split(separator: "\n") // Split the text into lines
        var lineArray: [[Int]] = [[]]
        
        for line in lines {
            let parts = line.split(separator: " ").compactMap { Int($0) } // Split line into parts and convert to Int
            lineArray.append(parts)
            
        }
        return lineArray
    }
    
    
    
    static func problem1(){
        var safes = 0

        let data = parseTextIntoArrays(input: input2)
        for (index, number) in data.enumerated() {
            if number.isEmpty { continue }
            var beforeCheck: [Int] = number
            
            var decreasing = beforeCheck[0] < beforeCheck[1]
            
            var sorted = beforeCheck.sorted { (firstElement, secondElement) -> Bool in
                if !decreasing {
                    return firstElement > secondElement
                } else {
                   return firstElement < secondElement
                }
            }
            
            var safeOrder = sorted == beforeCheck
            if !safeOrder {
                continue
            }
            var isSafe = true
            for (index, currentNumber) in number.enumerated() {
                if index + 1 <= number.count - 1 && isSafe {
                    if abs(number[index + 1] - currentNumber) < 1 || abs(number[index + 1] - currentNumber) > 3 {
                        isSafe = false
                    } else {
                        continue
                    }
                }
            }
            if isSafe {
                safes += 1
            }

        }
        print(safes)
    }
    
    static func problem1part2(){

    }
}



var input2: String = """
 7 6 4 2 1
 1 2 7 8 9
 9 7 6 2 1
 1 3 2 4 5
 8 6 4 4 1
 1 3 6 7 9
"""

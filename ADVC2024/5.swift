//
//  p5.swift
//  ADVC2024
//
//  Created by Pablo Rodriguez on 11/12/24.
//

import Foundation


class p5 {
    static func parseTextIntoArrays(input: String) -> [[Int]] {
        var result: [[Int]] = []
        let lines = input.split(separator: "\n")
         
        for line in lines {
            let values = line.split(separator: ",").compactMap { Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) }
             result.append(values)
        }
        
        return result
    }
    
    static func parseTextIntoDictionary(input: String) -> [String: String] {
        var result: [String: String] = [:]
        let lines = input.split(separator: "\n")
        
        for line in lines {
            let values = line.split(separator: "|").compactMap { Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) }
                let key = values[0]
                let value = values[1]
            result["\(key)\(value)"] = "\(key)\(value)"
            
        }
        
        return result
    }
    
    static func getMiddleElement<T>(array: [T]) -> T? {
        guard !array.isEmpty else {
            return nil  // Return nil if the array is empty
        }
        
        let middleIndex = (array.count - 1) / 2  // This works for both odd and even-length arrays
        return array[middleIndex]
    }

    static func problem1(){
        let arrayPageNumbers = parseTextIntoArrays(input: input52)
        let arrayRules = parseTextIntoDictionary(input: input51)
        var sumatory: Int = 0
        for pageList in arrayPageNumbers {
            var correct = true
            for i in 0..<pageList.count {
                if i == pageList.count - 1 || correct == false {
                    continue
                } else {
                    if arrayRules["\(pageList[i])\(pageList[(i+1)])"] != nil  {
                        correct = true
                    } else {
                        correct = false
                        
                    }
                }
            }
            if correct {
                sumatory += Int(getMiddleElement(array: pageList)!)
            }
        }
        print(sumatory)
    }
    
    static func problem1part2(){
        let arrayPageNumbers = parseTextIntoArrays(input: input52)
        let arrayRules = parseTextIntoDictionary(input: input51)
        var sumatory: Int = 0
        for pageList in arrayPageNumbers {
            var incorrect = 0
            for i in 0..<pageList.count {
                if i == pageList.count - 1 {
                    continue
                } else if incorrect == 0 {
                    let middleIndex = (pageList.count - 1) / 2
                    if i == middleIndex {
                        print( pageList[middleIndex + 2])

                    }
                    incorrect = 1
                } else {
                    if arrayRules["\(pageList[i])\(pageList[(i+1)])"] != nil  {
                        incorrect = 0
                    } else {
                        incorrect = 1
                    }
                }
            }
            if incorrect == 0 {
                sumatory += Int(getMiddleElement(array: pageList)!)
            }
        }
        print(sumatory)
    }
    
}


var input51: String = """
47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13
"""

var input52: String = """
75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47
"""

//
//  Find Maximum in Sliding Window.swift
//  
//
//  Created by Vladyslav Vcherashnii on 12/29/22.
//

import Foundation

class FindMaximumSlidingWindow {
    func findMaxSlidingWindow(nums: [Int], k: Int) -> [Int] {
        var result: [Int] = []
        var window: [Int] = []
        var windowSize: Int = k
        
        guard nums.count > 1 else { return nums }
        
        if windowSize > nums.count {
            windowSize = nums.count
        }
        
        for i in 0..<windowSize {
            while !window.isEmpty && nums[i] >= nums[window.last!] {
                window.removeLast()
            }
            window.append(i)
        }
        result.append(nums[window.first!])
        
        for i in windowSize..<nums.count {
            while !window.isEmpty && nums[i] >= nums[window.last!] {
                window.removeLast()
            }
            
            if !window.isEmpty && window.first! <= i-windowSize {
                window.removeFirst()
            }
            
            window.append(i)
            result.append(nums[window.first!])
        }
        
        return result
    }
}

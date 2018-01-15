# Function Practice (함수 만들기 연습)

~~~
//
//  FunctionPractice.swift
//  FuncPracitce
//
//  Created by richard oh on 2018. 1. 15..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import Foundation

class FunctionPractice{
    
    /// 정사각형 넓이 계산 함수
    ///
    /// - Parameter length: 변의 길이
    /// - Returns: 넓이 값
    func squareArea (length: Int) -> Int{
        
        return length * length
    }
    
    /// 정사각형 길이 계산 함수
    ///
    /// - Parameter length: 변의 길이
    /// - Returns: 총 길이 합
    func squarePerimeter (length : Int) -> Int {
        
        return 4 * length
    }
    

    /// 직사각형 넓이 계산 함수
    ///
    /// - Parameters:
    ///   - w: 세로 길이
    ///   - l: 가로 길이
    /// - Returns: 넓이 값
    func rectangleArea(width: Int,length: Int) -> Int {
        
        return width * length
        
    }
    
    /// 직사각형 길이 계산 함수
    ///
    /// - Parameters:
    ///   - w: 세로 길이
    ///   - l: 가로 길이
    /// - Returns: 총 길이 합
    func rectanglePerimeter(width: Int, length: Int) -> Int {
    
        return (2 * width) + (2 * length)
    
    }
    
    /// 원 넓이 계산 함수
    ///
    /// - Parameter radius: 원의 반지름 길이
    /// - Returns: 넓이 값
    func circleArea (radius: Double) -> Double {
    
        let pi: Double = 3.14
        
        return pi * (radius * radius)
    
    }
    
    /// 원 길이 계산 함수
    ///
    /// - Parameter radius: 원의 반지름 길이
    /// - Returns: 원 둘레의 길이
    func circlePerimeter (radius: Double) -> Double {
        
        let pi: Double = 3.14
        
        return 2 * pi * radius
        
    }
    
    /// 삼각형 넓이 계산
    ///
    /// - Parameters:
    ///   - base: 밑변의 길이
    ///   - height: 높이
    /// - Returns: 넓이 값
    func triangleArea(base: Int, height: Int) -> Int {
        
        return (1/2) * base * height
    
    }
    
    /// 사다리꼴 넓이 계산
    ///
    /// - Parameters:
    ///   - upperSide: 윗변의 길이
    ///   - lowerSide: 아랫변의 길이
    ///   - height: 높이
    /// - Returns: 넓이 값
    func trapezoidArea (upperSide: Int, lowerSide: Int, height: Int) -> Int {
        
        return (1/2) * height * (upperSide + lowerSide)
    }
    
    /// 정육면체 부피 계산
    ///
    /// - Parameter side: 모서리 길이
    /// - Returns: 넓이 값
    func cubeVolume (side: Int) -> Int {
        
        return side * side * side
        
    }
    
    /// 직육면체 부피 계산
    ///
    /// - Parameters:
    ///   - width: 폭,너비
    ///   - length: 길이
    ///   - h: 높이
    /// - Returns: 직육면체 부피 값
    func rectangularsolidVolume (width: Int, length: Int, height: Int) -> Int {
        
        return width * length * height
        
    }
    
    /// 원기둥 부피 계산
    ///
    /// - Parameters:
    ///   - radius: 원기둥 반지름
    ///   - height: 높이
    /// - Returns: 원기둥 부피 값
    func circularCylinderVolume (radius: Double, height: Double) -> Double{
        
        let pi: Double = 3.14
        
        return pi * (radius * radius) * height
    }
    
    /// 구의 부피 계산
    ///
    /// - Parameter radius: 반지름
    /// - Returns: 구 부피 값
    func sphereVolume (radius: Double) -> Double {
        
        let pi: Double = 3.14
        
        return (4/3) * pi * (radius * radius * radius)
    }
    
    /// 원뿔의 부피 계산
    ///
    /// - Parameters:
    ///   - radius: 반지름
    ///   - height: 높이
    /// - Returns: 원뿔의 부피 값
    func coneVolume (radius: Double, height: Double) -> Double{
        
        let pi: Double = 3.14
        
        return (1/3) * pi * square(mynum: radius) * height
        
    }
 
    /// 제곱 계산 함수
    ///
    /// - Parameter mynum: 제곱할 숫자
    /// - Returns: 제곱 값
    func square(mynum: Double) -> Double{
        
        return mynum * mynum
        
    }
    
    
}



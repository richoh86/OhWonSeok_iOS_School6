# Terran.swift

~~~
import Foundation


class Terran {
    
    // 유닛 이름 변수 선언
    var unit: String = ""
    
    /*******************공격/이동/방어 시작************************/
    // 공격
    func attack(){
        print("Go\(unit)attack")
    }
    // 공격 포인트 획득
    func attackpoint(point: Int){
        print("\(unit)이 공격 포인트\(point)를 얻었습니다")
    }
    
    // 이동
    func move(){
        print("let's go\(unit)move")
    }
    // 이동시 포인트 사용
    func mv_minuspoint(point :Int)  {
        print("\(unit)이 이동하여 포인트\(point)를 사용했습니다")
    }
    
    // 방어
    func defense(){
        print(unit+"defense")
    }
    // 방어시 포인트 사용
    func df_minuspoint(point: Int) {
        print("\(unit)이 방어하여 포인트\(point)를 사용했습니다")
    }
    /*******************공격/이동/방어 함수 끝***********************/
    
    /*******************단축키 모음 시작****************************/
    // 단축키#1 : 공격->이동->방어
    func shorcutkey1 (point: Int){
        
        attack()
        attackpoint(point: point)
        move()
        mv_minuspoint(point: point)
        defense()
        df_minuspoint(point: point)
        
    }
    // 단축키#2 : 이동->공격->방어
    func shorcutkey2 (point: Int){
        
        move()
        mv_minuspoint(point: point)
        attack()
        attackpoint(point: point)
        defense()
    }
    
    // 단축키#3 : 방어->공격->이동
    func shorcutkey3 (point: Int){
        
        defense()
        df_minuspoint(point: point)
        attack()
        attackpoint(point: point)
        move()
    }
    /***********************단축키 모음 끝*************************/
    
}
~~~
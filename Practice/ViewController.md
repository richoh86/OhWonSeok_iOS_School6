## ViewController.swift

~~~
import UIKit

class ViewController: UIViewController {
    
//    @IBOutlet var lb:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var person: Person = Person()
        person.name = "richard oh"
        person.work(time: 8)
        // time --> Arguments

//----------------------------Zerg------------------------------------//
        
        //유닛--> 히드라
        var zerg_hydra: Zerg = Zerg()
        zerg_hydra.unit = "hydra" // 유닛: 히드라
        
        zerg_hydra.attack()// 히드라 공격
        zerg_hydra.attackpoint(point: 3)// 히드라 공격 포인트 3 획득
        zerg_hydra.move()// 히드라 이동
        zerg_hydra.mv_minuspoint(point: 1)// 히드라 이동으로 인한 포인트 3 감소
        zerg_hydra.defense()// 히드라 방어
        zerg_hydra.df_minuspoint(point: 2)// 히드라 방어로 인한 포인트 2 감소
        
        zerg_hydra.shorcutkey1(point: 1) // 히드라 단축키#1 공격-이동-방어
        zerg_hydra.shorcutkey2(point: 1) // 히드라 단축키#2 이동->공격->방어
        zerg_hydra.shorcutkey3(point: 1) // 히드라 단축키#3 방어->공격->이동

        //유닛--> 저글링
        var zerg_zergling : Zerg = Zerg()
        zerg_zergling.unit = "zergling"
        
        zerg_zergling.attack()
        zerg_zergling.attackpoint(point: 2)
        zerg_zergling.move()
        zerg_zergling.mv_minuspoint(point: 1)
        zerg_zergling.defense()
        zerg_zergling.df_minuspoint(point: 2)
        
//----------------------------Protoss------------------------------------//
        
        //유닛--> 질럿
        var protoss_zealot: Protoss = Protoss()
        protoss_zealot.unit = "zealot"
        
        protoss_zealot.attack()
        protoss_zealot.attackpoint(point: 2)
        protoss_zealot.move()
        protoss_zealot.mv_minuspoint(point: 2)
        protoss_zealot.defense()
        protoss_zealot.df_minuspoint(point: 1)
   
//----------------------------Terran------------------------------------//
        
        //유닛--> 마린
        var terran_marine: Terran = Terran()
        terran_marine.unit = "marine"
        
        terran_marine.attack()
        terran_marine.attackpoint(point: 3)
        terran_marine.move()
        terran_marine.mv_minuspoint(point: 4)
        terran_marine.defense()
        terran_marine.df_minuspoint(point: 2)
        
//    lb.backgroundColor = .red
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
~~~
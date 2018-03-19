# Collection View

## Definition

> UICollectionView: An object that manages an ordered collection of data items and presents them using customizable layouts

> 데이터 항목의 정렬된 컬렉션을 관리하고 사용자 정의 레이아웃을 사용하여 데이터 항목을 제공하는 객체 

<p align="center"><img width="500" height="300" src="/Img/collection1.png"></p>

## Class & Protocol for implementing Collection View

- Manager 
  - UICollectionView
  - UICollectionViewController

- Protocol
  - UICollectionViewDataSource 
  - UICollectionViewDelegate 

- Presentation 
  - UICollectionReusableView
  - UICollectionViewCell

- Layout 
  - UICollectionViewLayout
  - UICollectionViewLayoutAttributes 
  - UICollectionViewUpdateItem 

- Flow Layout 
  - UICollectionViewFlowLayout
  - UICollectionViewDelegateFlowLayout

  
## Collection View Principle

> 아래 이미지를 보시면 Collection View Layout이 layout attributes를 설정하고 과 Delegate, DataSource 프로토콜을 이용해서 cell을 원하는대로 설정합니다

<p align="center"><img width="600" height="400" src="/Img/collection2.png"></p>

## Example Code

~~~
//
//  ViewController.swift
//  UICollectionViewClass
//
//  Created by richard oh on 2018. 3. 5..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainCollection: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.viewInCell.backgroundColor = .blue
        cell.viewInCell.layer.cornerRadius = 100
        cell.viewInCell.layer.masksToBounds = true
        
        return cell
    }
}

extension ViewController: UICollectionViewDataSource{
    
    // item의 size를 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 200, height: collectionView.frame.size.height)
    }
    
    // scroll direction이 horizontal인 경우 line space를 늘려줘야 cell간의 간격이 벌어진다
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
~~~

> UICollectionViewDelegateFlowLayout, UICollectionViewDataSource protocol 을 채택해서
> collection view를 목적에 맞게 customize 할 수 있다

- **UICollectionViewDelegateFlowLayout**: The methods of this protocol define the size of items and the spacing between items in the grid

- **UICollectionViewDataSource**: A data source object represents your app’s data model and vends information to the collection view as needed. It also handles the creation and configuration of cells and supplementary views used by the collection view to display your data








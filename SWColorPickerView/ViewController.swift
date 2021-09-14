//
//  ViewController.swift
//  SWColorPickerView
//
//  Created by 신상우 on 2021/09/14.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    let palette = Palette()
    var selectedRow: Int?
   
    let paletteView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(PaltteCell.self, forCellWithReuseIdentifier: "cell")
        view.backgroundColor = .white
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSubView()
        self.layout()
        self.paletteView.delegate = self
        self.paletteView.dataSource = self
     
    }

    func addSubView(){
        self.view.addSubview(self.paletteView)
    }
    
    func layout(){
        NSLayoutConstraint.activate([
            self.paletteView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            self.paletteView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            self.paletteView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.paletteView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
    }
    
    //MARK:-CollectionView delegate,datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.palette.paints.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PaltteCell
        cell.paintView.backgroundColor = self.palette.paints[indexPath.row]
        
        //선택된 셀이면 체크마크!
        cell.checkImageView.isHidden = true
        if let row = self.selectedRow {
            if indexPath.row == row {
                cell.checkImageView.isHidden = false
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedRow = indexPath.row
        collectionView.reloadData()
    }

}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(
                width: 54,
                height: 54
                )
    }
    
    
}


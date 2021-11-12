//
//  FirstTableViewCell.swift
//  Sign Up and Login Demo
//
//  Created by Sheraz Hussain on 10/11/2021.
//  Copyright © 2021 Sheraz Hussain. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageArray = [String]()
    var nameArray = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
   
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
          }
            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return nameArray.count
            }
            
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
                 
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
                cell.myImage.image = UIImage(named: imageArray[indexPath.row])
                cell.NameLbl.text = nameArray[indexPath.row]
                return cell
        //
            }

//            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//                return CGSize(width: 200, height: 200)
//            }
//        // Configure the view for the selected state
    }
    


//
//  TagsTableViewCell.swift
//  genomelinks
//
//  Created by Jason Long on 2018-08-13.
//  Copyright © 2018 Ahmed Mousa. All rights reserved.
//

import UIKit

protocol TagsTableViewCellDelegate: class {
    func updateSelectedCategory(_ category: String?)
}

class TagsTableViewCell: UITableViewCell {
    
    var tagNames = ["DEPRESSION", "EXTRAVERSION", "INTELLIGENCE", "OPENNESS"]
    weak var delegate: TagsTableViewCellDelegate?

    @IBOutlet weak var collectionView: UICollectionView!
    
    func setCell() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
    }
}

extension TagsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagsCell", for: indexPath) as! TagsViewCell
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 10.0
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.black.cgColor
        
        cell.label.text = tagNames[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        if cell?.backgroundColor == UIColor.lightGray { // if selected
            cell?.backgroundColor = UIColor.white
            delegate?.updateSelectedCategory(nil)
        } else { // if not selected
            for c in collectionView.visibleCells {
                c.backgroundColor = UIColor.white
            }
            cell?.backgroundColor = UIColor.lightGray
        }
        delegate?.updateSelectedCategory(tagNames[indexPath.row].lowercased())
    }
}

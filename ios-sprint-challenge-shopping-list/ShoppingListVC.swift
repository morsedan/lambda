//
//  ShoppingListVC.swift
//  Shopping List
//
//  Created by Kerby Jean on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

import UIKit


class ShoppingListVC: UICollectionViewController {
    
    // MARK: - Properties
    
    var shoppingController = ShoppingController()
    
    // MARK: - View Controller Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        collectionView.reloadData()
    }
    
    // MARK: - Functions
    
    func setupViews() {
       view.backgroundColor = .white
       collectionView?.backgroundColor = .white
       
       let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewItemVC))
       navigationItem.rightBarButtonItem = addButton
        
       self.collectionView!.register(ShoppingCell.self, forCellWithReuseIdentifier: ShoppingCell.id)
       self.collectionView?.reloadData()
    }

    
    @objc func addNewItemVC() {
        navigationController?.pushViewController(AddNewItemVC(), animated: true)
    }
    
   
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
        

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if section == 0 {
            return shoppingController.addedItems.count
        }
        return shoppingController.notAddedItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShoppingCell.id, for: indexPath) as! ShoppingCell
        let item = itemForSection(indexPath: indexPath)
        cell.configure(item)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = itemForSection(indexPath: indexPath)
        item.added = !item.added
        collectionView.reloadData()
    }
    
    func itemForSection(indexPath: IndexPath) -> ShoppingItem {
        if indexPath.section == 0 {
            return shoppingController.addedItems[indexPath.row]
        } else {
            return shoppingController.notAddedItems[indexPath.row]
        }
    }
}

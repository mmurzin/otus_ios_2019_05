//
//  Extension-UICollectionViewDataSource.swift
//  homework-1
//
//  Created by michael on 04/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation
import UIKit


extension BenchmarkViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.timers?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "timerViewCell", for: indexPath) as? TimerViewCell {
            guard let item = viewModel.timers?[indexPath.row] else {
                print("cell == nil")
                return cell
            }
            cell.timerItem = item
            cell.updatePieChart()
            return cell
        }
        return UICollectionViewCell()
    }
}


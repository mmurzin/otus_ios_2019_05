//
//  Extension-UICollectionViewDelegate.swift
//  homework-1
//
//  Created by michael on 04/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation
import UIKit

extension BenchmarkViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectTimer(row: indexPath.row)
        //updateTimerBehavior.didSelectTimer(indexPath, timers[indexPath.row])
        //updateCell(indexPath)
    }
    
}

//
//  SharedViewController.swift
//  homework-1
//
//  Created by michael on 11/07/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import UIKit

class SharedViewController: UIViewController {
    
    @IBOutlet weak var resultsTableView: UITableView!
    @IBOutlet weak var sharedTextVIew: UITextView!
    @IBOutlet weak var localeSegments: UISegmentedControl!
    
    var sharedViewModel:SharedViewModel?
    
    @IBAction func segmentedIndexChanged(_ sender: Any) {
        self.sharedViewModel?.selectedLocaleIndex = self.localeSegments.selectedSegmentIndex
    }
    
    @IBAction func homeButtonClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "SplitViewController")
        present(mainViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sharedViewModel?.bind{[unowned self] (state) in
            switch(state){
                case .idle:
                    self.initLocaleSegments(
                        self.sharedViewModel?.locales ?? [Locale]())
                    self.sharedTextVIew.text = self.sharedViewModel?.sharedText ?? ""
                    break
                case .result:
                    self.resultsTableView.reloadData()
                    break
                default:
                    break
            }
        }
    }
    
    private func initLocaleSegments(_ locales: [Locale]) {
        localeSegments.removeAllSegments()
        for locale in locales {
            localeSegments.insertSegment(withTitle: locale.identifier, at: localeSegments.numberOfSegments, animated: false)
        }
        
        self.sharedViewModel?.selectedLocaleIndex = 0
        self.localeSegments.selectedSegmentIndex =
            self.sharedViewModel?.selectedLocaleIndex ?? 0
        
    }
}

//
//  DataStructuresViewController.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/2/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

import UIKit

/**
 * Base subclass for the three view controllers, which handles most of the UI setup.
 */
class DataStructuresViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var resultsTableView: UITableView!
    @IBOutlet weak var createAndTestButton: UIButton!
    @IBOutlet weak var testOnlyButton: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var segmentElements: UISegmentedControl!
    @IBAction func sliderAdjusted(_ adjustedSlider: UISlider) {
        viewModel.numberOfItems = Int(ceil(adjustedSlider.value))
        testOnlyButton.isEnabled = false
        updateCountLabel()
    }
    
    @IBAction func createAndTest() {
        setControlsEnabled(false)
        self.viewModel.createAndTest()
    }
    
    @IBAction func testOnly() {
        setControlsEnabled(false)
        self.viewModel.testOnly()
    }
    
    @IBAction func segmentChanged(_ sender: Any) {
        viewModel.numberOfItems = viewModel.sizesForTest[segmentElements.selectedSegmentIndex]
        updateCountLabel()
    }
    
    var viewModel: DataStructuresViewModel
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = DataStructuresViewModel()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeBinder()
        testOnlyButton.isEnabled = false
        resultsTableView.isScrollEnabled = false
        viewModel.numberOfItems = viewModel.sizesForTest[segmentElements.selectedSegmentIndex]
        updateCountLabel()
    }
    
    func updateCountLabel() {
        countLabel.text = "Number of items: \(viewModel.numberFormatter.string(from: viewModel.numberOfItems as NSNumber)!)"
    }
    
    
    func setControlsEnabled(_ enabled: Bool) {
        testOnlyButton.isEnabled = enabled
        createAndTestButton.isEnabled = enabled
        if enabled {
            spinner.stopAnimating()
        } else {
            spinner.startAnimating()
        }
    }
    
    func formattedTime(_ time: TimeInterval) -> String? {
        return viewModel.timeNumberFormatter.string(from: time as NSNumber)
    }
    
    func initializeBinder() {
        viewModel.bind{[unowned self] (state) in
            switch(state){
            case .idle:
                break
            case .loading:
                self.setControlsEnabled(false)
                break
            case .result:
                self.setControlsEnabled(true)
                self.resultsTableView.reloadData()
                break
            default:
                break
            }
        }
    }
}

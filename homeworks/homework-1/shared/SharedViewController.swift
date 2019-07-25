//
//  SharedViewController.swift
//  homework-1
//
//  Created by michael on 11/07/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import UIKit

class SharedViewController: UIViewController {
// Text for testing: 23/12/2001, 12/12/2012, 1000 м, 2345 м, 8918 метр, 5000 метров, 1000.5 м, 2500,5 м
    
//
//    + 1. Реализовать для приложения ShareExtension
//    + 1.1 Настроить чтобы с любого сайта можно было выделить текст и отправить в приложение
//    + 1.2 При получениии ревеста от ShareExtension в приложении показывать ViewController
//    + 2. В этом ViewController:
//    + 2.1 Отображать Segmented Control переключения между локалями, например: английской(США), французской, китайской
//    + 2.2 Под ним Label с пошаренным текстом
//    + 2.3 Текст должен быть разобран существующие в нем даты и единицы измерений
//    + 3. При переключении сегментов в тексте поменять в тексте даты и единицы измерения на локализованные
//
//    *4. Поставить сегмент-контролы(100, 1К, 10К, 100К, 1М, 10М) вместо слайдеров во вьюконтроллерах тестов структур данных
//    Критерии оценки: Факт сдачи дз - 40 баллов
//    Сдача во время - 10 баллов
//    Наличие механизма шаринга - 20 баллов
//    Переключение локалей на тексте - 30 баллов
    
    
    
    @IBOutlet weak var resultsTableView: UITableView!
    @IBOutlet weak var sharedTextVIew: UITextView!
    @IBOutlet weak var localeSegments: UISegmentedControl!
    
    var sharedText = ""
    
    var locales = [Locale]()
    var datesInText = [Date]()
    var measurementInText = [Measurement]()
    
    var resultItems = [String]()
    
    
    private let datesSearcher = DatesSearcher()
    private let unitsSearcher = UnitsSearcher()
    
    @IBAction func segmentedIndexChanged(_ sender: Any) {
        loadCurrentTabData()
    }
    
    @IBAction func homeButtonClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "SplitViewController")
        present(mainViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViews()
        datesInText = datesSearcher.search(text: sharedText)
        measurementInText = unitsSearcher.search(text: sharedText)
        loadCurrentTabData()
    }
    
    private func initializeViews() {
        sharedTextVIew.text = sharedText
        initLocales()
        initLocaleSegments()
    }
    
    private func loadCurrentTabData() {
        let currentLocale = locales[localeSegments.selectedSegmentIndex]
        let localizator = Localizator(locale: currentLocale)
        
        resultItems.removeAll()
        resultItems.append(contentsOf:
            localizator.localizeDates(dates: datesInText))
        resultItems.append(contentsOf:
            localizator.localizeUnits(mesaurments: measurementInText))
        resultsTableView.reloadData()
    }
    
    private func initLocales() {
        locales.append(Locale(identifier: "ru-RU"))
        locales.append(Locale(identifier: "en"))
        locales.append(Locale(identifier: "fr"))
        locales.append(Locale(identifier: "zh_CN"))
    }
    
    private func initLocaleSegments() {
        localeSegments.removeAllSegments()
        for locale in locales {
            localeSegments.insertSegment(withTitle: locale.identifier, at: localeSegments.numberOfSegments, animated: false)
        }
        localeSegments.selectedSegmentIndex = 0
    }

}

extension SharedViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        cell.textLabel?.text = resultItems[indexPath.row]
        return cell
    }
}



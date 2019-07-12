//
//  SharedViewController.swift
//  homework-1
//
//  Created by michael on 11/07/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import UIKit

class SharedViewController: UIViewController {
    
//
//    1. Реализовать для приложения ShareExtension
//    1.1 Настроить чтобы с любого сайта можно было выделить текст и отправить в приложение
//    1.2 При получениии ревеста от ShareExtension в приложении показывать ViewController
//    + 2. В этом ViewController:
//    + 2.1 Отображать Segmented Control переключения между локалями, например: английской(США), французской, китайской
//    + 2.2 Под ним Label с пошаренным текстом
//    2.3 Текст должен быть разобран существующие в нем даты и единицы измерений
//    3. При переключении сегментов в тексте поменять в тексте даты и единицы измерения на локализованные
//
//    *4. Поставить сегмент-контролы(100, 1К, 10К, 100К, 1М, 10М) вместо слайдеров во вьюконтроллерах тестов структур данных
//    Критерии оценки: Факт сдачи дз - 40 баллов
//    Сдача во время - 10 баллов
//    Наличие механизма шаринга - 20 баллов
//    Переключение локалей на тексте - 30 баллов
    
    @IBOutlet weak var resultsTableView: UITableView!
    @IBOutlet weak var sharedTextVIew: UITextView!
    @IBOutlet weak var localeSegments: UISegmentedControl!
    
    
    let dateRegex = #"\d{1,2}\/\d{1,2}\/\d{4}"#
    
    var sharedText = "23/12/2001, 12/12/2012"
    var locales = [Locale]()
    var datesInText = [Date]()
    var resultItems = [String]()
    
    @IBAction func segmentedIndexChanged(_ sender: Any) {
        loadCurrentTabData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViews()
        searchDateItems()
        loadCurrentTabData()
    }
    
    func initializeViews() {
        sharedTextVIew.text = sharedText
        initLocales()
        initLocaleSegments()
    }
    
    func loadCurrentTabData() {
        let currentLocale = locales[localeSegments.selectedSegmentIndex]
        resultItems.removeAll()
        resultItems.append(contentsOf: getTimeItemsWithLocale(locale: currentLocale))
        resultsTableView.reloadData()
    }
    
    func searchDateItems() {
        var dates = [String]()
        dates.append(contentsOf: self.search(text: sharedText, regex: dateRegex))
        
        for dateString in dates {
            if let date = getDate(foramt: "dd/MM/yyyy", date: dateString) {
                datesInText.append(date)
            }
        }
    }
    
    func initLocales() {
        locales.append(Locale(identifier: "ru-RU"))
        locales.append(Locale(identifier: "en"))
        locales.append(Locale(identifier: "fr"))
        locales.append(Locale(identifier: "zh_CN"))
    }
    
    func initLocaleSegments() {
        localeSegments.removeAllSegments()
        for locale in locales {
            localeSegments.insertSegment(withTitle: locale.identifier, at: localeSegments.numberOfSegments, animated: false)
        }
        localeSegments.selectedSegmentIndex = 0
    }
    
    func search(text: String, regex: String) -> [String] {
        do {
            let regexItem = try NSRegularExpression(pattern: regex)
            let results = regexItem.matches(in: text,
                                            range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        }  catch let error {
            print("search error \(error)")
        }
        return [String]()
    }
    
    func getDate(foramt:String, date:String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = foramt
        dateFormatter.timeZone = TimeZone(identifier:"GMT")
        return dateFormatter.date(from: date)
    }
    
    func getTimeItemsWithLocale(locale:Locale) -> [String] {
        let dateFormatter = DateFormatter()
        let dateTemplate = "dMMMMyEEEE"
        
        var dates = [String]()
        dateFormatter.setLocalizedDateFormatFromTemplate(dateTemplate)
        dateFormatter.locale = locale
        
        for date in datesInText {
            dates.append(dateFormatter.string(from: date))
        }
        
        return dates
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


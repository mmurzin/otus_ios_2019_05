//
//  SuffixArrayViewController.swift
//  homework-1
//
//  Created by michael on 01/07/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//
import UIKit

//1. Создать SuffixSequence
//1.1 Как показано в уроке создать SuffixIterator
//1.2 Обернуть в SuffixSequence каждое слово из AlgoProvider
//2. Собрать профилирование структуры данных Suffix Array
//2.1 Склеить все SuffixSequence в единый массив с элементами кортежами типа (suffix, algoName)
//2.2 Отсортировать этот массив по алфавиту
//2.3 Создать вью контроллер по типу Array/Set/Dictionary

// ??? 2.4 Сделать 1-3 теста на прог всех имен аглоритмов

//2.4.1 Используя StringGenerator делать поиск по 10 случайный трехбуквенным сочетаниям(подстрокам)

// ??? 2.4.2 Сделать режим теста с отладкой которая будет показывать сколько раз находить подстроки
//*3. Вставить UISearchController на таблицу фида
//3.1 Организовать такой же поиск по FeedDataProvider
//3.2 Выводить в серч контроллер результаты поиска

private enum SuffixArrayVCRow: Int {
    case creation = 0,
    creationWithAlgoNames,
    search10Random,
    search10RandomWithCondition,
    remove1Entry,
    remove5Entries,
    remove10Entries,
    lookup1Entry,
    lookup10Entries
}

class SuffixArrayViewController: DataStructuresViewController {
    
    let suffixArrayMinpulator: SuffixArrayManipulator = SwiftSuffixArrayManipulator()
    
    var creationTime: TimeInterval = 0
    var creationAlgoTime: TimeInterval = 0
    var search10Words: TimeInterval = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAndTestButton.setTitle("Create SuffixArray and Test", for: [])
        slider.isEnabled = false
    }
    
    override func create(_ size: Int) {
        creationTime = suffixArrayMinpulator.setupWithSize(size)
    }
    
    override func test() {
        if suffixArrayMinpulator.arrayHasObjects() {
            creationAlgoTime = suffixArrayMinpulator.setupWithObjects(items:Services.algoProvider.all, reverse:false)
            search10Words = suffixArrayMinpulator.searchRandomWords(count: 10, wordSize: 3)
        } else {
            
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        switch (indexPath as NSIndexPath).row {
        case SuffixArrayVCRow.creation.rawValue:
            cell.textLabel!.text = "Array Creation:"
            cell.detailTextLabel!.text = formattedTime(creationTime)
        case SuffixArrayVCRow.creationWithAlgoNames.rawValue:
            cell.textLabel!.text = "Creation with AlgoProvider:"
            cell.detailTextLabel!.text = formattedTime(creationAlgoTime)
        case SuffixArrayVCRow.search10Random.rawValue:
            cell.textLabel!.text = "Search 10 words:"
            cell.detailTextLabel!.text = formattedTime(search10Words)
        default:
            print("Unhandled row! \((indexPath as NSIndexPath).row)")
        }
        
        return cell
    }
}

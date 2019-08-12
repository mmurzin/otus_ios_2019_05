//
//  AlgorithmsService.swift
//  homework-1
//
//  Created by michael on 12/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

protocol AlgorithmsProvider {
    func getAlgorithmsList() -> [String]
}

final class AlgorithmsService: AlgorithmsProvider {
    func getAlgorithmsList() -> [String] {
        return [
            //With profiler
            "Array",
            "Set",
            "Dictionary",
            "SuffixArray",
            // Searching
            "Linear Search",
            "Binary Search",
            "Count Occurrences",
            "Select Minimum / Maximum",
            "k-th Largest Element",
            "Selection Sampling",
            "Union-Find",
            // String Search
            "Brute-Force String Search",
            "Boyer-Moore",
            "Knuth-Morris-Pratt",
            "Rabin-Karp",
            "Longest Common Subsequence",
            "Z-Algorithm",
            // Sorting
            "Insertion Sort",
            "Selection Sort",
            "Shell Sort",
            "Quicksort",
            "Merge Sort",
            "Heap Sort",
            "Introsort",
            "Counting Sort",
            "Radix Sort",
            "Topological Sort",
            "Bubble Sort",
            "Slow Sort",
            // Compression
            "Run-Length Encoding (RLE)",
            "Huffman Coding",
            // Miscellaneous
            "Shuffle",
            "Comb Sort",
            "Convex Hull",
            "Miller-Rabin Primality Test",
            "MinimumCoinChange",
            "Genetic",
            "Myers Difference Algorithm",
            // Mathematics
            "Greatest Common Divisor (GCD)",
            "Permutations and Combinations",
            "Shunting Yard Algorithm",
            "Karatsuba Multiplication",
            "Haversine Distance",
            "Strassen's Multiplication Matrix",
            // Machine learning
            "k-Means Clustering",
            "Linear Regression",
            "Naive Bayes Classifier",
            "Simulated annealing",
        ]
    }
}

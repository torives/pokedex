//
//  Strings.swift
//  pokedex
//
//  Created by yves on 18/06/20.
//  Copyright © 2020 yves. All rights reserved.
//

import Foundation

struct Strings {
    
    // MARK: - FilterView
    static let filterViewTitle = NSLocalizedString("FilterViewTitle", comment: "")
    static let filterViewSubtitle = NSLocalizedString("FilterViewSubtitle", comment: "")
    static let filterViewTypes = NSLocalizedString("Types", comment: "")
    static let filterViewWeaknesses = NSLocalizedString("Weaknesses", comment: "")
    static let filterViewHeights = NSLocalizedString("Heights", comment: "")
    static let filterViewWeights = NSLocalizedString("Weights", comment: "")
    static let filterViewNumberRange = NSLocalizedString("Number Range", comment: "")
    static let filterViewReset = NSLocalizedString("Reset", comment: "")
    static let filterViewApply = NSLocalizedString("Apply", comment: "")
    
    // MARK: - GenerationView
    static let generationViewTitle = NSLocalizedString("GenerationViewTitle", comment: "")
    static let generationViewSubtitle = NSLocalizedString("GenerationViewSubtitle", comment: "")
    static let generation = NSLocalizedString("Generation", comment: "")
    
    // MARK: - SortView
    static let sortViewTitle = NSLocalizedString("SortViewTitle", comment: "")
    static let sortViewSubtitle = NSLocalizedString("SortViewSubtitle", comment: "")
    static let sortViewOrderSmallestFirst = NSLocalizedString("Smallest number first", comment: "")
    static let sortViewOrderHighestFirst = NSLocalizedString("Highest number first", comment: "")
    static let sortViewOrderAlphabetical = NSLocalizedString("Alphabetical order", comment: "")
    static let sortViewOrderReverseAlphabetical = NSLocalizedString("Reverse alphabetical order", comment: "")
}

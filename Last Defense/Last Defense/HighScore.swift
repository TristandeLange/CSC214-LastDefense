//
//  HighScore.swift
//  Last Defense
//
//  Created by Tristan De Lange on 11/12/20.
//  Copyright © 2020 Tristan de Lange. All rights reserved.
//

import Foundation

class HighScore {
    //saves data as high score only if it's greater than the current high score
    func save(data: Int){
        let saveData = UserDefaults.standard
        if data > saveData.integer(forKey: "Highscore"){
            saveData.set(data, forKey: "Highscore")
        }
    }
    //returns the current high score
    func load() -> Int {
        let loadData = UserDefaults.standard
        return loadData.integer(forKey: "Highscore")
    }
}

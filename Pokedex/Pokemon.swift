//
//  Pokemon.swift
//  Pokedex
//
//  Created by Mike Zhang Xunda on 28/6/17.
//  Copyright © 2017 Mike Zhang Xunda. All rights reserved.
//

import Foundation

class Pokemon {
    fileprivate var _name: String!
    fileprivate var _pokedexId: Int!
    
    //getter
    var name: String {
        return _name
    }
    
    //getter
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int){
        self._name = name
        self._pokedexId = pokedexId
    }
}

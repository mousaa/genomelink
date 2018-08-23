//
//  Event.swift
//  genomelinks
//
//  Created by ahmed mousa on 2018-08-22.
//  Copyright © 2018 Ahmed Mousa. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Event {
    let location: String
    let description: String
    let id: String
    let name: String
    let date: String
    let intelligence: Int
    let depression: Int
    let openness: Int
    let extraversion: Int
    var total: Int
    
    init(location: String, description: String, id: String, name: String, date: String, intelligence: Int,  depression: Int,openness: Int, extraversion: Int, total: Int) {
        self.id = id
        self.location = location
        self.description = description
        self.name = name
        self.date = date
        self.intelligence = intelligence
        self.depression = depression
        self.openness = openness
        self.extraversion = extraversion
        self.total = total
        print("\(id)-> \(name)")
    }
    
    convenience init? (snapshot: DataSnapshot){
        guard
            let val = snapshot.value as? [String:Any],
            let name = val["name"] as? String,
            let description = val["description"] as? String,
            let location = val["location"] as? String,
            let intelligence = val["intelligence"] as? Int,
            let depression = val["depression"] as? Int,
            let openness = val["openness"] as? Int,
            let extraversion = val["extraversion"] as? Int,
            let total = val["total"] as? Int,
            let date = val["date"] as? String
            else {
                return nil
        }
        let id = snapshot.key
        self.init(location: location, description: description, id: id, name: name, date: date, intelligence: intelligence, depression: depression, openness: openness, extraversion: extraversion, total: total)
    }
}

//
//  DBManager.swift
//  PokemonApp
//
//  Created by Kirill Kubarskiy on 27.10.22.
//

import Foundation
import RealmSwift

class DBManager {
    
    func save<T: Object>(_ object: T) {
        let realm = try! Realm(configuration: .defaultConfiguration)
        try! realm.write {
            realm.add(object)
        }
    }
    
    func save<T: Object>(_ objects: [T]) {
        let realm = try! Realm(configuration: .defaultConfiguration)
        try! realm.write {
            realm.add(objects)
        }
    }
    
    func getObjects<T: Object>(_ classType: T.Type, completion: @escaping (_ objects: [T]) -> ()) {
        let realm = try! Realm(configuration: .defaultConfiguration)
        let result = realm.objects(T.self)

        completion(Array(result))
    }

    func getObjects<T: Object>(_ classType: T.Type) -> [T] {
        let realm = try! Realm(configuration: .defaultConfiguration)
        let result = realm.objects(T.self)

        return Array(result)
    }
    
    func deleteAllObject<T: Object>(_ object: [T]) {
        let realm = try! Realm(configuration: .defaultConfiguration)
        let objects = realm.objects(T.self)
        try! realm.write {
            realm.delete(objects)
        }
    }
    
}

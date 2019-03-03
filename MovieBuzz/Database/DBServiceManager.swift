//
//  DBService.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 03/03/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DBServiceManager: NSObject {
    static let shared = DBServiceManager()
    
    func saveMovieAsFavorite(movieId : Int?,movieName : String?) -> Bool{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        var isFavorite = true
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Movies")
        request.predicate = NSPredicate(format: "id = %d", movieId!)
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            if result.count != 0 {
                for data in result as! [NSManagedObject] {
                    print(data.value(forKey: "id") as! Int)
                    let favValue = data.value(forKey: "isFavorite") as! Bool
                    data.setValue(!favValue, forKey: "isFavorite")
                    isFavorite = !favValue
                }
            } else {
                let entity = NSEntityDescription.entity(forEntityName: "Movies", in: context)
                let newMovie = NSManagedObject(entity: entity!, insertInto: context)
                newMovie.setValue(movieName, forKey: "name")
                newMovie.setValue(true, forKey: "isFavorite")
                newMovie.setValue(movieId, forKey: "id")
            }
        } catch {
            print("Failed")
        }
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
        return isFavorite
    }
    
    func checkFavoriteStatusForMovie(movieID : Int?) -> Bool{
        var isFavorite = false
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Movies")
        request.predicate = NSPredicate(format: "id = %d", movieID!)
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            if result.count != 0 {
                for data in result as! [NSManagedObject] {
                    print(data.value(forKey: "isFavorite") as! Int)
                    isFavorite = data.value(forKey: "isFavorite") as! Bool
                }
            }
        } catch {
            print("Failed")
        }
        return isFavorite
    }
    
    func fetchFavoriteMovies() -> [Movie]{
        var favMovies : [Movie] = [Movie]()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Movies")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            if result.count != 0 {
                for data in result as! [NSManagedObject] {
                    print(data.value(forKey: "name") as! String)
                    var attributes : [String:Any] = [String:Any]()
                    attributes["name"] = data.value(forKey: "name") as! String
                     attributes["movieId"] = data.value(forKey: "id") as! Int
                    favMovies.append(Movie.init(attributes: attributes))
                }
            }
        } catch {
            print("Failed")
        }
        return favMovies
    }
}

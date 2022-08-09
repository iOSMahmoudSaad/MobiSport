//
//  SportCoreData.swift
//  Sports App
//
//  Created by Mahmoud Saad on 03/08/2022.
//

import Foundation
import CoreData

protocol DeletionDelegate{
    func deleteLeagueAtIndexPath(indexPath: IndexPath)
}

class DBManager{
    static let sharedInstance = DBManager()
    private init(){
        
    }
}
extension DBManager{
    func addLeague(leagueTitle : String , leagueImage : String ,leagueYoutube:String, idLeague : String,  appDelegate: AppDelegate){
        let managedContext = appDelegate.persistentContainer.viewContext
        if let entity = NSEntityDescription.entity(forEntityName: "Leaguess", in: managedContext){
            let League = NSManagedObject(entity: entity, insertInto: managedContext)
            League.setValue(leagueTitle, forKey: "strLeague")
            League.setValue(leagueImage, forKey: "strBadge")
            League.setValue(leagueYoutube, forKey: "strYoutube")
            League.setValue(idLeague, forKey: "idLeague")
            do {
                try managedContext.save()
                
            }catch let error as NSError {
                
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchData(appDelegate: AppDelegate) -> [Leaguess]{
 
        var fetchedList : [Leaguess] = []
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Leaguess")
 
        do{
            fetchedList = try managedContext.fetch(fetchRequest) as! [Leaguess]
             
        }catch let error as NSError {
             
            print(error.localizedDescription)
        }
        return fetchedList
    }
    func delete(league:Leaguess, indexPath: IndexPath, appDelegate: AppDelegate, delegate: DeletionDelegate){

        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(league)
        do{
            try managedContext.save()
            delegate.deleteLeagueAtIndexPath(indexPath: indexPath)
            
        }catch let error as NSError{
             
            print(error.localizedDescription)
        }
        
    }
}

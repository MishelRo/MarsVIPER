//
//  ParseManager.swift
//  TestMarsSwinJectProject
//
//  Created by User on 05.03.2021.
//

import Foundation

protocol ParseManagerProtocol{
    func parseData(complession: @escaping(ResponceModel)->())
}

class ParseManager: ParseManagerProtocol{
    var networkManager: NetworkManagerProtocol{
        ServiceContainer.shared.resolve(_protocol: NetworkManagerProtocol.self)!
    }
    
    func parseData(complession: @escaping(ResponceModel)->()){
        networkManager.getData { (responce) in
            guard let data = responce.data else {return}
            do{
            let decoded = try JSONDecoder().decode(ResponceModel.self, from: data)
                complession(decoded)
            } catch {
                print (error.localizedDescription)
            }
        }
    }
}

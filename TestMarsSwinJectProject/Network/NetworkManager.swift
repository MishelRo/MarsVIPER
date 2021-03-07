//
//  NetworkManager.swift
//  TestMarsSwinJectProject
//
//  Created by User on 05.03.2021.
//
import Foundation
import Alamofire

protocol  NetworkManagerProtocol {
    func getData(complession: @escaping(AFDataResponse<Any>)->() )
}

final class NetworkManager: NetworkManagerProtocol{
    
    static  var shared = NetworkManager()
    
    var params = ["sol": 1000,
                  "page": 1,
                  "api_key": Constants.api_key] as [String : Any]
    
    func getData(complession: @escaping(AFDataResponse<Any>)->() ){
        AF.request(Constants.url, method: .get, parameters: params, encoding: URLEncoding.default, headers: .none, interceptor: .none, requestModifier: .none).responseJSON { (responce) in
            complession(responce)
        }
    }
    private init(){}
}

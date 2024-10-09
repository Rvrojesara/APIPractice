//
//  ApiManager.swift
//  ApiPractice1
//
//  Created by admin on 09/10/24.
//

import Foundation
import Alamofire

class ApiManager{
    
    let urlstr="https://api.thecatapi.com/v1/images/search?limit=10"
    
    func fetchcat(catdata:@escaping(Result<[Catmodel],Error>)->Void){
        AF.request(urlstr).responseDecodable(of: [Catmodel].self){
            response in
            switch response.result{
            case.success(let data):
                catdata(.success(data))
                
            case.failure(let error):
                catdata(.failure(error))
            }
            
        }
    }
}

//
//  DataManeger.swift
//  spaceXApi
//
//  Created by AbdulKadir Akkaş on 29.09.2021.
//

import Foundation
import Alamofire

struct DataManager {
    
    func fetchData(completion: @escaping (Result<DataModel , Error>) -> Void) {
        let url = "https://api.spacexdata.com/v4/launches/latest"
        AF.request(url).responseDecodable(of: DataModel.self, queue: .main,  decoder: JSONDecoder()) { response in
            
            switch response.result {
            case .success(let dataModel):
                completion(.success(dataModel))
            case .failure(let error) :
                completion(.failure(error))
            }
        }
    }
}

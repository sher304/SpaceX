//
//  Network.swift
//  SpaceX
//
//  Created by Шермат Эшеров on 19/8/22.
//

import Foundation
import Alamofire


protocol NetworkDelegate{
    func parseStarShip(completion: @escaping ([StarShip]) -> Void)
}


class Network: NetworkDelegate{
    func parseStarShip(completion: @escaping ([StarShip]) -> Void) {
        guard let url = URL(string: "https://api.spacexdata.com/v4/rockets") else { return }
        AF.request(url).response { request in
            DispatchQueue.main.async {
                guard let data = request.data else { return }
                guard let responce = try? JSONDecoder().decode([StarShip].self, from: data) else { return }
                completion(responce)
            }
        }
    }
}

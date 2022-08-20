//
//  ViewModel.swift
//  SpaceX
//
//  Created by Шермат Эшеров on 19/8/22.
//

import Foundation

class MainViewModel{
    
    private lazy var network: Network = {
        return Network()
    }()
    
    var items = Dynamic([StarShip(height: Diameter(meters: 0, feet: 0), diameter: Diameter(meters: 0, feet: 0), mass: Mass(kg: 0, lb: 0), firstStage: FirstStage(thrustSeaLevel: Thrust(kN: 0, lbf: 0), thrustVacuum: Thrust(kN: 0, lbf: 0), reusable: false, engines: 0, fuelAmountTons: 0, burnTimeSEC: 0), secondStage: SecondStage(thrust: Thrust(kN: 0, lbf: 0), payloads: Payloads(compositeFairing: CompositeFairing(height: Diameter(meters: 0, feet: 0), diameter: Diameter(meters: 0, feet: 0)), option1: ""), reusable: false, engines: 0, fuelAmountTons: 0, burnTimeSEC: 0), engines: Engines(isp: ISP(seaLevel: 0, vacuum: 0), thrustSeaLevel: Thrust(kN: 0, lbf: 0), thrustVacuum: Thrust(kN: 0, lbf: 0), number: 0, type: "", version: "", layout: "", engineLossMax: 0, propellant1: "", propellant2: "", thrustToWeight: 0), landingLegs: LandingLegs(number: 0, material: ""), payloadWeights: [PayloadWeight(id: "", name: "", kg: 0, lb: 0)], flickrImages: [], name: "", type: "", active: false, stages: 0, boosters: 0, costPerLaunch: 0, successRatePct: 0, firstFlight: "", country: "", company: "", wikipedia: "", welcomeDescription: "", id: "")])
    
    func shareData(){
        network.parseStarShip { [self] datas in
            items.value = datas
        }
    }
    
    init(){
        
    }
}

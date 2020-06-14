//
//  DataLoader.swift
//  ANODA
//
//  Created by mac on 13.06.2020.
//  Copyright © 2020 Aleksandr Balabon. All rights reserved.
//

import Foundation

public class DataDownloadManager {
    
    var userData = [PostData]()
    
    init() {
        load()
    }
    
    func load(){
        if let filePath = Bundle.main.url(forResource: "data", withExtension: "json" ){
            do {
                let data = try Data(contentsOf: filePath)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([String: [PostData]].self, from: data)

                guard let userData = dataFromJson["news_feed"] else { return }
                self.userData = userData
                
            } catch {
                print(error)
            }
        }
    }
}

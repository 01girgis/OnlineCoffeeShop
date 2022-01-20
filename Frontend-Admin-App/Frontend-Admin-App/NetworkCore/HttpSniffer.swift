//
//
//
//  Created by Romany GirGis, 2022.
//  Copyright © 2022 All rights reserved

import Foundation


//API communication error
enum ApiErr:Error {
    case  invalidRsponse , badUrl , noDecoding
}

// basic services class
class HttpSniffer {
    
    //class singleton
    private init (){}
    static let sharedSniffer = HttpSniffer()
    
    //Mark: --Http Get Request
    func FetchData<T:Codable> (url:URL) async throws -> [T] {
        
        //start Data exchange session
        let (data,response) = try await URLSession.shared.data(from: url)
        
        //Check Http Response status code
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw ApiErr.invalidRsponse
        }
        
        //Decode data from API
        guard let myData = try? JSONDecoder().decode([T].self, from: data) else {
            throw ApiErr.noDecoding
        }
        
    return myData
    }
    
}

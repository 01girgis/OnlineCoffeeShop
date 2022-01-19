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
    
    //Http Get Request
    func FetchData<T:Codable> (url:URL) async throws -> [T] {
        
        //start Data exchange session
        let (data,response) = try await URLSession.shared.data(from: url)
        
        //Check Http Response status code
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw ApiErr.invalidRsponse
        }
    }
    
}

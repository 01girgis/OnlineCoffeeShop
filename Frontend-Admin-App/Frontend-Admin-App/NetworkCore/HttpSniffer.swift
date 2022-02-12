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

//HTTP Methods Selection
enum HttpMethodSelect:String{
    case GET , POST , PUT , DELETE
}

//Header Format Types
enum FormatTypes:String{
    case JSON = "application/json" ,
         CONTENT = "Content-Type"
}

// basic services class
class HttpSniffer {
    
    //class singleton
    private init (){}
    static let sharedSniffer = HttpSniffer()
    
    //MARK: --Http Get Request
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
    
    //MARK: - Post Request
    func PostReq<T:Codable> (to url:URL , object:T , httpMethod:String) async throws {
         //Prepare Url Request
        var urlReq = URLRequest(url: url)
        urlReq.httpMethod = httpMethod
        urlReq.addValue(FormatTypes.JSON.rawValue, forHTTPHeaderField: FormatTypes.CONTENT.rawValue)
        
        //Encoding Data
        urlReq.httpBody = try! JSONEncoder().encode(object)
        let (_,response) = try await URLSession.shared.data(for: urlReq)
        
        //check Response
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw ApiErr.invalidRsponse
        }
    }
    
    //MARK: - Delete Request
    func DeleteReq(at id:UUID , url:URL) async throws {
        //Prepare Url Request
        var urlReq = URLRequest(url: url)
        urlReq.httpMethod = HttpMethodSelect.DELETE.rawValue
        
        //Request Perform
        let (_ , res) = try  await URLSession.shared.data(for: urlReq)
        
        //check Request Responding
        guard (res as? HTTPURLResponse)?.statusCode == 200 else {
            throw ApiErr.invalidRsponse
        }
    }
    
}

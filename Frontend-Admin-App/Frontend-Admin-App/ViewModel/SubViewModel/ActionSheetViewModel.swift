//
//
//
//  Created by Romany GirGis, 2022.
//  Copyright © 2022 All rights reserved

import Foundation

//Sub View class
final class ActionSheetViewModel:ObservableObject{
    //Add Main Model fields
    @Published var myID:UUID?
    @Published var name:String = ""
    @Published var price:String  = ""
    @Published var description:String = ""
    
    //Class Constructor Set
    init(){}
    //Class Constructor on Update Request.
    init(updateObject:Product) {
        self.myID = updateObject.id
        self.name = updateObject.name
        self.price = String(updateObject.price)
        self.description = updateObject.description ?? "no data"
    }
   
    func updateRequest() async throws{
        //Prepare Communication Address
        let url = FirstP.url + EndP.point
        //Check Url Availability
        guard let urlPath = URL(string: url) else {
            throw ApiErr.badUrl
        }
        
        //Pass Data for being Update
        let dataUpdate = Product(id: myID, name: name, price: Float(price) ?? 0 , description: description)
        //Process Request
        try await HttpSniffer.sharedSniffer.PostReq(to: urlPath, object: dataUpdate, httpMethod: HttpMethodSelect.PUT.rawValue)
    }
    
    
}

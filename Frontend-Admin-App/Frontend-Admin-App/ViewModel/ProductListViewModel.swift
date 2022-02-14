//
//
//
//  Created by Romany GirGis, 2022.
//  Copyright © 2022 All rights reserved

import Foundation

class ProductListModelView: ObservableObject {
    @Published var prods = [Product]()
    
    //Get Request in ViewModel
    func Fetching() async throws {
        //url  parameters
        let url = FirstP.url + EndP.point
        
        //check url
        guard let urlPath = URL(string: url) else {
            throw ApiErr.badUrl
        }
        
        //Data  Fetching to class model
        let dataGet:[Product] = try await HttpSniffer.sharedSniffer.FetchData(url: urlPath)
        
        //add fetching method to main thread
        DispatchQueue.main.async {
            self.prods = dataGet
        }
    }
    
    //Data Reload Func
    func dataReload(){
        Task{
            do{
                try await Fetching()
                //errorCheck = "Drinks List"
            }
            //Error Check
            catch{
                print("Error")
            }
        }
    }
    
    //Post Request in ViewModel
    func SendData(ToObject:Product) async throws {
        //Prepare
        let url = FirstP.url + EndP.point
        guard let urlPath = URL(string: url) else {
            throw ApiErr.badUrl
        }
        
        //Data on Post Request
        let dataToSend = Product(id: nil, name: ToObject.name , price: ToObject.price, description: ToObject.description)
        
        //
        try await HttpSniffer.sharedSniffer.PostReq(to: urlPath, object: dataToSend, httpMethod: HttpMethodSelect.POST.rawValue)
    }
    
    //Put Request Func
    func updateRequest(objectForUpdate:Product) async throws{
        //Prepare Communication Address
        let url = FirstP.url + EndP.point
        //Check Url Availability
        guard let urlPath = URL(string: url) else {
            throw ApiErr.badUrl
        }
        
        //Process Request
        try await HttpSniffer.sharedSniffer.PostReq(to: urlPath, object: objectForUpdate, httpMethod: HttpMethodSelect.PUT.rawValue)
    }
    
    //Delete Request Func
    func deleteRequest(at offsets: IndexSet) {
        offsets.forEach{ i in
            //Check Selected ID
            guard let prodID = prods[i].id else {
                print("no ID on Offset")
                return
             }
            
            //Delete Req Url Path
            let url = FirstP.url + EndP.point
            
            //check Url Validity
            guard let delUrl = URL(string: url + "/\(prodID)") else {
                print("error in Selecting ID for Del Request")
                return
            }
            
            
        }
    }
}

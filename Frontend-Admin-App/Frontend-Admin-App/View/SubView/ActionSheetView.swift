//
//
//
//  Created by Romany GirGis, 2022.
//  Copyright © 2022 All rights reserved

import SwiftUI

struct ActionSheetView: View {
    /*Variables Initialization*/
    //Main View Model
    @StateObject var mainVModel = ProductListModelView()
    //SubView Model
    @ObservedObject var subVModel = ActionSheetViewModel()
    //Enviromental Variables
    @Environment(\.dismiss) var endView
    
    var body: some View {
        //Control Fields
        TextField("Enter your Name",text: $subVModel.name)
            .padding()
            .border(.black)
            .cornerRadius(50)
        TextField("Enter your Price",text: $subVModel.price)
            .padding()
            .border(.black)
            .cornerRadius(50)
        TextField("Enter your Descrition",text: $subVModel.description)
            .padding()
            .border(.black)
            .cornerRadius(50)
        
        //Action Button
        Button{
            /*Checking ID For Determination if Which Request To Process Put or Post*/
            guard subVModel.myID != nil else {
                //Clear All Fileds if it was Post Req.
                self.subVModel.name = subVModel.name
                self.subVModel.price = subVModel.price
                self.subVModel.description = subVModel.description
                
                //Pass Request Data
                let Posting = Product(id: self.subVModel.myID , name: self.subVModel.name, price: Float(self.subVModel.price) ?? 0, description: self.subVModel.description)
                
                //Rquest Task
                Task{
                    do{
                        try await mainVModel.SendData(ToObject: Posting)
                    }catch{
                        print("Error on Posting")
                    }
                }
                
                //Debug Test
                print("Post REq.")
                endView()
                return
            }
            //Task Session For Updating
            Task{
                //Perform Update Request
                let updating = Product(id: subVModel.myID, name: subVModel.name, price: Float(subVModel.price) ?? 0, description: subVModel.description )
                
                try await mainVModel.updateRequest(objectForUpdate: updating)
            }
            
            //Debug
            print("Put REq.")
            endView()
        }label: {
            Text(subVModel.actionBtn)
        }
    }
}

struct SheetModalView_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetView()
    }
}

//
//
//
//  Created by Romany GirGis, 2022.
//  Copyright © 2022 All rights reserved

import SwiftUI

struct ProductView: View {
    
    //view model instance
    @StateObject var vModel = ProductListModelView()
    @State var postAcionSheet:Bool = false
    @State var updateActionSheet:Bool = false
    var body: some View {
        NavigationView{
            //data list
            List{
                //data fetching loop
                ForEach(vModel.prods){ products in
                    //get data into cells as buttons
                    Button{
                       // showAcionSheet.toggle()
                        updateActionSheet.toggle()
                        print("test")
                    }label: {
                        //set float type format of price
                        let reFormatFloat = String(format: "%.2f", products.price)
                //print data fileds
                Text("\(products.name) \nPrice: \(reFormatFloat) \nDescription: \(products.description ?? "no discription added")")
                            .foregroundColor(.black)
                    }
                    
                    //Update Sheet for Put Request.
                    .sheet(isPresented: $updateActionSheet){
                        ActionSheetView(subVModel: ActionSheetViewModel(updateObject: products))
                    }
                }
            }
            .navigationTitle(Text("Drinks List"))
            .toolbar{
                //Post request action button
                Button{
                    postAcionSheet.toggle()
                }label: {
                    Label("",systemImage: "plus.rectangle")
                        .foregroundColor(.black)
                }
            }
            .sheet(isPresented: $postAcionSheet,onDismiss: {Task{try await vModel.Fetching()}}){
                             ActionSheetView()
            }
        }
        .onAppear{
            //Fetch data on apllication open
            Task{
                do{
                    try await vModel.Fetching()
                    //errorCheck = "Drinks List"
                }
                //Error Check
                catch{
                    print("Error")
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}

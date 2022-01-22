//
//
//
//  Created by Romany GirGis, 2022.
//  Copyright © 2022 All rights reserved

import SwiftUI

struct ProductView: View {
    
    //view model instance
    @StateObject var vModel = ProductListModelView()
    
    var body: some View {
        NavigationView{
            //data list
            List{
                //data fetching loop
                ForEach(vModel.prods){ products in
                    //get data into cells as buttons
                    Button{
                        print("test")
                    }label: {
                        //set float type format of price 
                        let reFormatFloat = String(format: "%.2f", products.price)
                //print data fileds
                Text("\(products.name) \nPrice: \(reFormatFloat) \nDescription: \(products.description ?? "no discription added")")
                            .foregroundColor(.black)
                    }
                }
            }
            .navigationTitle(Text("Drinks List"))
        }
        .onAppear{
            //Fetch data on apllication open
            Task{
                try await vModel.Fetching()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}

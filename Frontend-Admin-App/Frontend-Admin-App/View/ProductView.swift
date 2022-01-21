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
                    //get into cells as buttons
                    Button{
                        print("test")
                    }label: {
                        Text("ss")
                    }
                }
            }
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

//
//
//
//  Created by Romany GirGis, 2022.
//  Copyright © 2022 All rights reserved

import SwiftUI

struct ProductView: View {
    @StateObject var vModel = ProductListModelView()
    
    var body: some View {
        NavigationView{
            
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

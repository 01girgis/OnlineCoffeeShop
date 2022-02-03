//
//
//
//  Created by Romany GirGis, 2022.
//  Copyright © 2022 All rights reserved

import SwiftUI

struct SheetModalView: View {
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
            print("Action")
        }label: {
            Text("Process")
        }
    }
}

struct SheetModalView_Previews: PreviewProvider {
    static var previews: some View {
        SheetModalView()
    }
}

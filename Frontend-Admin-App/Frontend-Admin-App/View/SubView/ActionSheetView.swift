//
//
//
//  Created by Romany GirGis, 2022.
//  Copyright © 2022 All rights reserved

import SwiftUI

struct SheetModalView: View {
    /*Variables Initialization*/
    //Main View Model
    @StateObject var mainModel = ProductListModelView()
    //SubView Model
    @ObservedObject var sheetMod = ActionSheetViewModel()
    //Enviromental Variables
    @Environment(\.dismiss) var endView
    
    var body: some View {
        //Control Fields
        TextField("Enter your Name",text: $sheetMod.name)
            .padding()
            .border(.black)
            .cornerRadius(50)
        TextField("Enter your Price",text: $sheetMod.price)
            .padding()
            .border(.black)
            .cornerRadius(50)
        TextField("Enter your Descrition",text: $sheetMod.description)
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

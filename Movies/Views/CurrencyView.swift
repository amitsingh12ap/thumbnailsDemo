//
//  CurrencyView.swift
//  Movies
//
//  Created by 13216146 on 03/02/20.
//  Copyright © 2020 13216146. All rights reserved.
//

import SwiftUI

struct CurrencyView: View {
    @ObservedObject var viewModel: CurrencyViewModel
    @State var searchedText: String = ""
    
    var body: some View {
        NavigationView {
            List {
                TextField("Type your search",text: $searchedText,onCommit: {
//                    if let currencyList = self.viewModel.currencyList {
//
//                    }
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
            }
            .navigationBarTitle("Currency Converter")
        }
    }
}

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView(viewModel: CurrencyViewModel())
    }
}

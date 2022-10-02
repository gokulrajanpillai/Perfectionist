//
//  DailyLifeView.swift
//  Perfectionist
//
//  Created by Harsh Yadav on 02/10/22.
//  Copyright © 2022 RAJAN. All rights reserved.
//

import SwiftUI

struct DailyLifeView: View {
    
    @ObservedObject var dailyLifeVM:DailyLifeViewModel = DailyLifeViewModel()
    @State var route:NavigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $route){
            ZStack{
                Color.yellow.opacity(0.7).ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack{
                        Text("Daily Life")
                            .font(.title)
                            .bold()
                        
                        ForEach(dailyLifeVM.cellData,id:\.id) { data in
                            NavigationLink(value: data) {
                                CustomCellView(imageName: data.image, cellTitle: data.cellTitle)
                                    .tint(.black)
                            }
                            Divider()
                        }
                    }
                }
            }
            .navigationDestination(for: CellModel.self, destination: { value in
                self.dailyLifeVM.push(to: value.cellTitle)
                    .navigationTitle(value.cellTitle)
                    .navigationBarTitleDisplayMode(.inline)
            })
            .navigationTitle("Life Track Status")
        }
    }
}

struct DailyLifeView_Previews: PreviewProvider {
    static var previews: some View {
        DailyLifeView()
    }
}

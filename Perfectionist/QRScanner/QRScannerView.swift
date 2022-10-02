//
//  QRScannerView.swift
//  Perfectionist
//
//  Created by Harsh Yadav on 03/10/22.
//  Copyright © 2022 RAJAN. All rights reserved.
//

import SwiftUI

struct QRScannerView: View {
    @State var title:String = ""
    @ObservedObject var scannerVM = QRScannerViewModel()
    var body: some View {
        VStack{
            Text("Scanned content will be displayed here!")
            
            Button {
                self.scannerVM.showScanner.toggle()
            } label: {
                Text("Scan")
            }
        }
        .sheet(isPresented: $scannerVM.showScanner) {
            ReaderViewRepresentable(vc: self.scannerVM.readerVC)
        }

    }
}

struct QRScannerView_Previews: PreviewProvider {
    static var previews: some View {
        QRScannerView()
    }
}

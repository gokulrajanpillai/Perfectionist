//
//  QRScannerView.swift
//  Perfectionist
//
//  Created by Harsh Yadav on 03/10/22.
//  Copyright © 2022 RAJAN. All rights reserved.
//

import SwiftUI
import QRCodeReader

struct QRScannerView: View {
    @State var title:String = ""
    @ObservedObject var scannerVM = QRScannerViewModel()
    var body: some View {
        VStack{
            Text("Scanned content will be displayed here!")
            Text("\(title)")
            Button {
                if(self.scannerVM.showScanner){
                    self.scannerVM.readerVC.completionBlock = { (result: QRCodeReaderResult?) in
                        if let result = result{
                            print("RESULT: \(result)")
                            self.title = result.value
                        }else{
                            print("Nothing Retrieved")
                        }
                    }
                }
                
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

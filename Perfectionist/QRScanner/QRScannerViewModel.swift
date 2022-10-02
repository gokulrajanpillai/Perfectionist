//
//  QRScannerViewModel.swift
//  Perfectionist
//
//  Created by Harsh Yadav on 03/10/22.
//  Copyright © 2022 RAJAN. All rights reserved.
//


import UIKit
import SwiftUI
import QRCodeReader
import AVFoundation


class QRScannerViewModel:ObservableObject{
    @Published var showScanner:Bool = false
    
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()
    
    init(){
        self.readerVC.delegate = self
    }

}

extension QRScannerViewModel:QRCodeReaderViewControllerDelegate{
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        reader.stopScanning()
        self.showScanner = false
    }

    //This is an optional delegate method, that allows you to be notified when the user switches the cameraName
    //By pressing on the switch camera button
    func reader(_ reader: QRCodeReaderViewController, didSwitchCamera newCaptureDevice: AVCaptureDeviceInput) {
        let trueCameraName: String? = newCaptureDevice.device.localizedName
        if let cameraName = trueCameraName {
            print("Switching capturing to: \(cameraName)")
        }
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()
        self.showScanner = false
    }
}





struct ReaderViewRepresentable:UIViewRepresentable{
    let vc:UIViewController
    init(vc: UIViewController) {
        self.vc = vc
    }
    func makeUIView(context: Context) -> some UIView {
//        let vc = QRScannerViewController()
        return self.vc.view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

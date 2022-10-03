//
//  QRScannerViewController.swift
//  Perfectionist
//
//  Created by RAJAN on 1/7/18.
//  Copyright © 2018 RAJAN. All rights reserved.
//

import UIKit
import QRCodeReader
import AVFoundation

//class QRScannerViewController: UIViewController, QRCodeReaderViewControllerDelegate {
//
//    @IBOutlet weak var scannedContentLabel: UILabel!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//
//    lazy var readerVC: QRCodeReaderViewController = {
//        let builder = QRCodeReaderViewControllerBuilder {
//            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
//        }
//        
//        return QRCodeReaderViewController(builder: builder)
//    }()
//    
//    @IBAction func scanAction(_ sender: AnyObject) {
//        // Retrieve the QRCode content
//        // By using the delegate pattern
//        readerVC.delegate = self
//        
//        // Or by using the closure pattern
//        readerVC.completionBlock = { (result: QRCodeReaderResult?) in
//            print(result ?? "nothing retrieved")
//            self.scannedContentLabel.text = result?.value
//        }
//        
//        // Presents the readerVC as modal form sheet
//        readerVC.modalPresentationStyle = .formSheet
//        present(readerVC, animated: true, completion: nil)
//    }
//    
//    // MARK: - QRCodeReaderViewController Delegate Methods
//    
//    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
//        reader.stopScanning()
//        
//        dismiss(animated: true, completion: nil)
//    }
//    
//    //This is an optional delegate method, that allows you to be notified when the user switches the cameraName
//    //By pressing on the switch camera button
//    func reader(_ reader: QRCodeReaderViewController, didSwitchCamera newCaptureDevice: AVCaptureDeviceInput) {
//        let trueCameraName: String? = newCaptureDevice.device.localizedName
//        if let cameraName = trueCameraName {
//            print("Switching capturing to: \(cameraName)")
//        }
//    }
//    
//    func readerDidCancel(_ reader: QRCodeReaderViewController) {
//        reader.stopScanning()
//        
//        dismiss(animated: true, completion: nil)
//    }
//
//}

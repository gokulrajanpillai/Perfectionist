//
//  QRScannerViewController.swift
//  Perfectionist
//
//  Created by RAJAN on 1/7/18.
//  Copyright © 2018 RAJAN. All rights reserved.
//

import UIKit
import SwiftUI
import QRCodeReader
import AVFoundation

struct QRScannerViewRepresentable:UIViewRepresentable{
    func makeUIView(context: Context) -> some UIView {
        let vc = QRScannerViewController()
        return vc.view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

class QRScannerViewController: UIViewController, QRCodeReaderViewControllerDelegate {

    var scannedLabel:UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Scanned content will be displayed here!"
        label.textColor = .black
        return label
    }()
    
    var scanButton:UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Scan", for: .normal)
        button.titleLabel?.textColor = .blue
        button.titleLabel?.backgroundColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()
    
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
    
    // MARK: - QRCodeReaderViewController Delegate Methods
    
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        reader.stopScanning()
        
        dismiss(animated: true, completion: nil)
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
        dismiss(animated: true, completion: nil)
    }

}



extension QRScannerViewController{
    private func setup(){
        self.view.addSubview(scannedLabel)
        self.scannedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(scanButton)
        self.scanButton.translatesAutoresizingMaskIntoConstraints = false
        self.scanButton.addTarget(self, action: #selector(scanButtonAction), for: .touchUpInside)
    }
    
    private func layout(){
        NSLayoutConstraint.activate([
            self.scannedLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.scannedLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.scannedLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7),
            self.scannedLabel.heightAnchor.constraint(equalToConstant: 60),
            
            self.scanButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.scanButton.topAnchor.constraint(equalToSystemSpacingBelow: self.scannedLabel.bottomAnchor, multiplier: 4),
            self.scanButton.widthAnchor.constraint(equalToConstant: 100),
            self.scanButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    @objc func scanButtonAction(){
        readerVC.delegate = self
        
        // Or by using the closure pattern
        readerVC.completionBlock = { (result: QRCodeReaderResult?) in
            print(result ?? "nothing retrieved")
//            self.scannedContentLabel.text = result?.value
            self.scannedLabel.text = result?.value
        }
        
        // Presents the readerVC as modal form sheet
        readerVC.modalPresentationStyle = .formSheet
        present(readerVC, animated: true, completion: nil)
    }
}

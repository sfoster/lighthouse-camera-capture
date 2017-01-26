//
//  RecordImageViewController.swift
//  Record Image (Image Capture)
//
//  Created by Sam Foster on 1/23/17.
//  Copyright © 2017 Foster. All rights reserved.
//

import UIKit
import AVFoundation

class RecordImageViewController: UIViewController, AVCapturePhotoCaptureDelegate {

    @IBOutlet weak var cameraView: UIImageView!
    @IBOutlet weak var button: UIButton!

    var captureSession : AVCaptureSession!
    var sessionOutput : AVCapturePhotoOutput!
    var previewLayer : AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("button zIndex: \(button.layer.zPosition)")
        print("preview zIndex: \(button.layer.zPosition)")

        captureSession = AVCaptureSession()
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        sessionOutput = AVCapturePhotoOutput()
        
        let deviceSession = AVCaptureDeviceDiscoverySession(deviceTypes: [.builtInDualCamera, .builtInTelephotoCamera, .builtInWideAngleCamera], mediaType: AVMediaTypeVideo, position: .unspecified )
        let deviceLength = deviceSession?.devices?.count
        print("Checking each of \(deviceLength) devices")
        for device in (deviceSession?.devices)! {
            if device.position == AVCaptureDevicePosition.back {
                print("Considering back camera")
                do {
                    let input = try AVCaptureDeviceInput(device: device)
                    if captureSession.canAddInput(input) {
                        captureSession.addInput(input)
                        if captureSession.canAddOutput(sessionOutput) {
                            print("Adding input, output to session")
                            captureSession.addOutput(sessionOutput)
                            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                            previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
                            // TODO: match videoOrientation to the current device orientation
                            previewLayer.connection.videoOrientation = .portrait
                            print("previewLayer hooked up")
                            
                            cameraView.layer.addSublayer(previewLayer)
                            cameraView.addSubview(button)
                            
                            previewLayer.position = CGPoint( x: self.cameraView.frame.width/2, y: self.cameraView.frame.height/2 )
                            previewLayer.bounds = cameraView.frame
                            button.layer.zPosition += 1
                            
                            captureSession.startRunning()
                            print("captureSession now running")

                            
                            print("button zIndex: \(button.layer.zPosition)")
                            
                            print("cameraView zIndex: \(cameraView.layer.zPosition)")
}
                    }
                    
                } catch let avError  {
                    print(avError)
                }
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func takePhotoAction(_ sender: UIButton) {
        print("takePhotoAction")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ARController.swift
//  ARRPG
//
//  Created by Michael Sweeney on 5/5/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import UIKit
import AVFoundation

class ARController {
    
    var cameraSession : AVCaptureSession?
    var cameraLayer : AVCaptureVideoPreviewLayer?
    
    func setup(withView: UIView) {
        self.loadCamera(forView: withView)
        self.cameraSession?.startRunning()
    }
    
    //TODO: Implement fallback functionality for no camera access or ar turned off
    
    func createCaptureSession() -> (session: AVCaptureSession?, error: NSError?) {
        
        var error: NSError?
        var captureSession: AVCaptureSession?
        
        let backVideoDevice = AVCaptureDevice.defaultDevice(withDeviceType: .builtInWideAngleCamera, mediaType: AVMediaTypeVideo, position: .back)
        
        if backVideoDevice != nil {
            var videoInput : AVCaptureDeviceInput!
            do {
                videoInput = try AVCaptureDeviceInput(device: backVideoDevice)
            } catch let error1 as NSError {
                error = error1
                videoInput = nil
            }
            
            if error == nil {
                captureSession = AVCaptureSession()
                
                if captureSession!.canAddInput(videoInput) {
                    captureSession?.addInput(videoInput)
                } else {
                    error = NSError(domain: "", code: 0, userInfo: ["description": "Error adding video input"])
                }
            } else {
                error = NSError(domain: "", code: 1, userInfo: ["description": "Error creating capture device input"])
            }
            
        } else {
            error = NSError(domain: "", code: 2, userInfo: ["description":"back video device not found"])
        }
        
        return (session: captureSession, error: error)
        
    }
    
    private func loadCamera(forView: UIView) {
        let captureSessionResult = self.createCaptureSession()
        
        guard captureSessionResult.error == nil, let session = captureSessionResult.session else {
            print("error creating capture session")
            //TODO: should route to backup implementation
            return
        }
        
        self.cameraSession = session
        
        if let cameraLayer = AVCaptureVideoPreviewLayer(session: self.cameraSession) {
            cameraLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            cameraLayer.frame = forView.bounds
            forView.layer.insertSublayer(cameraLayer, at: 0)
            self.cameraLayer = cameraLayer
        }
    }

    
}

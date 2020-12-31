//
//  ViewController.swift
//  MyCamera
//
//  Created by Kim Kyung Dong on 12/31/20.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var pictureImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func cameraButtonAction(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("camera is available")
            
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .camera
            imagePickerController.delegate = self
            present(imagePickerController, animated: true, completion: nil)
            
        } else {
            print("camera is not available")
        }
        
        func imagePickerController(_ picker : UIImagePickerController, didFinishPickingMediaWithInfo info : [UIImagePickerController.InfoKey : Any]) {
            pictureImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            dismiss(animated: true, completion: nil)
        }
        
    }
    @IBAction func shareButtonAction(_ sender: Any) {
    }
    

}


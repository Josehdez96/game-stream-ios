//
//  SUImagePickerView.swift
//  SUImagePickerView
//
//  Created by Karthick Selvaraj on 02/05/20.
//  Copyright © 2020 Karthick Selvaraj. All rights reserved.
//

import SwiftUI
import UIKit

struct SUImagePickerView: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var image: Image?
    @Binding var isPresented: Bool
    
    func makeCoordinator() -> ImagePickerViewCoordinator {
        return ImagePickerViewCoordinator(image: $image, isPresented: $isPresented)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = sourceType
        pickerController.delegate = context.coordinator
        return pickerController
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Nothing to update here
    }

}

class ImagePickerViewCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var image: Image?
    @Binding var isPresented: Bool
    
    init(image: Binding<Image?>, isPresented: Binding<Bool>) {
        self._image = image
        self._isPresented = isPresented
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let UiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.image = Image(uiImage: UiImage)
            if let data = UiImage.pngData() {
                let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] // Estoy eligiendo una ruta y la guardo en [documents]
                let url = documents.appendingPathComponent("profilephoto.png") // a la ruta elegida ([documents]) le agrego un archivo mas con nombre [profilephoto.png] pero aun sin tener nada por dentro ese archivo
                do{
                    try data.write(to: url) // Aquí asigno la imagen que tomé ([data]) al archivo vacío que cree en la ruta especificada del dispositivo (.documentDirectory)
                }catch {
                    print("No pude guardar fotografía en el dispositivo")
                }
            }
        }
        self.isPresented = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.isPresented = false
    }
    
}


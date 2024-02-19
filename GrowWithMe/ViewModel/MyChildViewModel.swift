//
//  MyChildViewModel.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 19.02.2024.
//

import Foundation
import UIKit

class MyChildViewModel: ObservableObject {
    @Published var myChildData: [MyChildDataModel] = []
    @Published var isAddChildViewPresented: Bool = false
    
    init() {
        loadChild()
    }
    
    func presentAddChild() {
        isAddChildViewPresented = true
    }
    
    func addChildData(_ dataModel: MyChildDataModel) {
        myChildData.append(dataModel)
        updateChild()
    }
    
    func loadChild() {
        if let data = UserDefaults.standard.data(forKey: "child") {
            do {
                myChildData = try JSONDecoder().decode([MyChildDataModel].self, from: data)
            } catch {
                print("Error decoding child: \(error.localizedDescription)")
            }
        }
    }
    
    func deleteChild(_ myChild: MyChildDataModel) async {
        if let index = myChildData.firstIndex(where: { $0.id == myChild.id }) {
            myChildData.remove(at: index)
            updateChild()
            
        }
    }
    
    func updateChild() {
        saveChild()
        DispatchQueue.main.async {
            self.objectWillChange.send()
            self.loadChild()
        }
    }
    
    func saveChild() {
        do {
            let encodedData = try JSONEncoder().encode(myChildData)
            UserDefaults.standard.set(encodedData, forKey: "child")
        } catch {
            print("Error encoding child: \(error.localizedDescription)")
        }
    }

    
}

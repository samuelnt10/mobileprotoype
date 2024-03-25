//
//  ContentView.swift
//  prototype
//
//  Created by Samuel Ntambwe on 2024-03-24.
//

//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//}
import UIKit

class ContentView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize and display the home screen
        let homeVC = HomeViewController()
        present(homeVC, animated: true, completion: nil)
    }
}

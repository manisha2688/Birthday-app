//
//  ContentView.swift
//  Birthday-app
//
//  Created by Manisha Raman on 11/7/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var newName = ""
    @State private var newBirthday = Date.now
    @State private var friends: [Friend]
    = [ Friend(name:"Nicole",birthday: .now),Friend(name:"Geethika", birthday: .now) ]
    
    var body: some View {
        
        List(friends, id: \.name) {friend in
            HStack{
                Text(friend.name)
                Spacer()
                Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                
            }
            
            
            
            
        }
        .padding()
        .navigationTitle("Birthdays")
        .safeAreaInset(edge: .bottom){
            VStack
        }
        
    }
    
    
    
    #Preview {
        ContentView()
    }
}

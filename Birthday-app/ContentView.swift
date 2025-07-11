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
            VStack(alignment: .center, spacing: 20){
                Text("New Birthday")
                    .font(.headline)
                DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date){
                    TextField("Name", text: $newName)
                        .textFieldStyle(
                            .roundedBorder)
                    
                }
                Button("Save"){
                    let newFriend = Friend(name:
                                            newName, birthday:
                                            newBirthday)
                    friends.append(newFriend)
                }
                .bold
                
            }
            .padding()
            .background(.bar)
        }
        
    }
    
}

}

    
    #Preview{
        ContentView()
    }


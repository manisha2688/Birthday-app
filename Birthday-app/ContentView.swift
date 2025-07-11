//
//  ContentView.swift
//  Birthday-app
//
//  Created by Manisha Raman on 11/7/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var newName = ""
    @State private var newBirthday = Date.now
    @Query private var friends: [Friend]
    @Environment(\.modelContext) private var context
    
    
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
                        context.insert(newFriend)
                    }
                    .bold()
                    
                }
                .padding()
                .background(.bar)
            }
            
        }
        
    }
    
    
    
    
    #Preview{
        ContentView()
            .modelContainer(for: Friend.self, inMemory: true)
    }
    


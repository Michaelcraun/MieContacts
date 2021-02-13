//
//  SearchBar.swift
//  ContactList_Test
//
//  Created by Michael Craun on 1/23/21.
//

import SwiftUI

struct SearchBar: View {
    
    @State private var isEditing: Bool = false
    
    @Binding var text: String
    
    var body: some View {
    
        HStack {
            
            TextField("Search...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                 
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                }, label: {
                    Text("Cancel")
                })
                .padding(.trailing, 10)
                
            }
            
        }
        .animation(.easeInOut(duration: 0.1))
        
    }
    
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Appl"))
    }
}

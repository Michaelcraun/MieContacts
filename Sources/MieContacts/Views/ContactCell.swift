//
//  ContactCell.swift
//  ContactList_Test
//
//  Created by Michael Craun on 1/23/21.
//

import SwiftUI
import Contacts

struct ContactCell: View {
    
    typealias OnSelect = (Contact) -> Void
    
    @State private var isSelected: Bool = false
    
    private var image: UIImage {
        if let data = contact.imageData {
            return UIImage(data: data)!
        } else if let data = contact.thumbnailImageData {
            return UIImage(data: data)!
        } else {
            return UIImage(systemName: "person.fill")!
        }
    }
    
    let contact: Contact
    let allowsMultiSelect: Bool
    var displaysKey: ContactService.Key?
    var displaysImage: Bool = false
    let onSelect: OnSelect
    
    var body: some View {
    
        HStack {
            
            if allowsMultiSelect {
                
                RadioButton(isSelected: $isSelected)
                    .foregroundColor(Color(.systemGray4))
                    .frame(width: 25, height: 25)
                
            }
            
            if displaysImage {
                
                Image(uiImage: contact.image)
                    .resizable()
                    .scaledToFit()
                    .background(Color.gray)
                    .clipShape(Circle())
//                    .frame(minHeight: 0, maxHeight: .infinity, alignment: .leading)
                    .frame(minWidth: 50, maxWidth: 50, alignment: .leading)
//                    .frame(width: 40, height: 40)
                
            }
            
            VStack(alignment: .leading) {
                
                HStack(spacing: 3) {
                    
                    Text(contact.givenName)
                        .multilineTextAlignment(.leading)
                
                    Text(contact.familyName)
                        .bold()
                        .multilineTextAlignment(.leading)
                    
                }
                
                if let key = displaysKey, contact.valueFor(key: key) != "" {
                    
                    Text(contact.valueFor(key: key))
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                }
                
            }
            
            Spacer()
            
        }
        .padding(5)
        .onTapGesture {
            isSelected.toggle()
            onSelect(contact)
        }
    
    }
    
}

struct ContactCell_Previews: PreviewProvider {
    static var previews: some View {
        ContactCell(contact: Contact(), allowsMultiSelect: true, displaysImage: true, onSelect: { _ in })
    }
}

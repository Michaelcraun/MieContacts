//
//  Contact.swift
//  ContactList_Test
//
//  Created by Michael Craun on 1/23/21.
//



import UIKit
import Contacts

@available(iOS 14, *)
public struct Contact: Identifiable {
    
    public typealias ContactRelation = (label: String, relation: CNContactRelation)
    public typealias ContactDate = (label: String, date: Date)
    public typealias ContactEmailAddress = (label: String, address: String)
    public typealias ContactInstantMessageAddress = (label: String, address: CNInstantMessageAddress)
    public typealias ContactPhoneNumber = (label: String, phoneNumber: CNPhoneNumber)
    public typealias ContactPostalAddress = (label: String, address: CNPostalAddress)
    public typealias ContactSocialProfile = (label: String, profile: CNSocialProfile)
    public typealias ContactURLAddress = (label: String, address: String)
    
    private let contact: CNContact?
    
    public let id: UUID = UUID()
    
    public var birthday: Date? {
        return contact?.birthday?.date
    }
    public var contactRelations: [ContactRelation] {
        return (contact?.contactRelations ?? []).map { ($0.label ?? "Unknown", $0.value)}
    }
    public var contactType: CNContactType {
        return contact?.contactType ?? .person
    }
    public var dates: [ContactDate] {
        return (contact?.dates ?? []).map { ($0.label ?? "Unknown", $0.value.date ?? Date() )}
    }
    public var departmentName: String {
        return contact?.departmentName ?? ""
    }
    public var emailAddresses: [ContactEmailAddress] {
        return (contact?.emailAddresses ?? []).map { ($0.label ?? "Unknown", String($0.value))}
    }
    public var familyName: String {
        return contact?.familyName ?? "Contact"
    }
    public var givenName: String {
        return contact?.givenName ?? "Unknown"
    }
    public var identifier: String {
        return contact?.identifier ?? ""
    }
    public var image: UIImage {
        if let data = imageData, imageDataAvailable {
            return UIImage(data: data) ?? UIImage()
        } else {
            return UIImage(systemName: "person.fill") ?? UIImage()
        }
    }
    public var imageData: Data? {
        return contact?.imageData
    }
    public var imageDataAvailable: Bool {
        return contact?.imageDataAvailable ?? false
    }
    public var instantMessageAddresses: [ContactInstantMessageAddress] {
        return (contact?.instantMessageAddresses ?? []).map { ($0.label ?? "Unkown", $0.value)}
    }
    public var jobTitle: String {
        return contact?.jobTitle ?? ""
    }
    public var middleName: String {
        return contact?.middleName ?? ""
    }
    public var namePrefix: String {
        return contact?.namePrefix ?? ""
    }
    public var nameSuffix: String {
        return contact?.nameSuffix ?? ""
    }
    public var nickname: String {
        return contact?.nickname ?? ""
    }
    public var nonGregorianBirthday: Date? {
        return contact?.nonGregorianBirthday?.date
    }
    public var organizationName: String {
        return contact?.organizationName ?? ""
    }
    public var phoneNumbers: [ContactPhoneNumber] {
        return (contact?.phoneNumbers ?? []).map { ($0.label ?? "Unknown", $0.value)}
    }
    public var phoneticFamilyName: String {
        return contact?.phoneticFamilyName ?? ""
    }
    public var phoneticGivenName: String {
        return contact?.phoneticGivenName ?? ""
    }
    public var phoneticMiddleName: String {
        return contact?.phoneticMiddleName ?? ""
    }
    public var phoneticOrganzationName: String {
        return contact?.phoneticOrganizationName ?? ""
    }
    public var postalAddresses: [ContactPostalAddress] {
        return (contact?.postalAddresses ?? []).map { ($0.label ?? "Unkown", $0.value) }
    }
    public var previousFamilyName: String {
        return contact?.previousFamilyName ?? ""
    }
    public var socialProfiles: [ContactSocialProfile] {
        return (contact?.socialProfiles ?? []).map { ($0.label ?? "Unknown", $0.value) }
    }
    public var thumbnailImageData: Data? {
        return contact?.thumbnailImageData
    }
    public var urlAddresses: [ContactURLAddress] {
        return (contact?.urlAddresses ?? []).map { ($0.label ?? "Unknown", String($0.value)) }
    }
    
    init() {
        self.contact = nil
    }
    
    init(contact: CNContact) {
        self.contact = contact
    }
    
    /// <#Description#>
    /// - TODO: Add documentation detailing what keys can be shown? -- OR --
    /// - TODO: Finish each case?
    /// - Parameter key: <#key description#>
    /// - Returns: <#description#>
    func valueFor(key: ContactService.Key) -> String {
        switch key {
        case .identifier: return identifier
        case .type: return "\(contactType)"
        case .birthday: return birthday?.description ?? ""
        case .gregorianBirthday: return nonGregorianBirthday?.description ?? ""
        case .departmentName: return departmentName
        case .jobTitle: return jobTitle
        case .organizationName: return organizationName
        case .phoeneticOrganizationName: return phoneticOrganzationName
//        case .emailAddresses: return ListFormatter.localizedString(byJoining: emailAddresses.map({ $0.address }))
//        case .instantMessageAddresses: return ListFormatter.localizedString(byJoining: instantMessageAddresses.map({ "\($0.label): \($0.address)" }))
//        case .postalAddresses: return ListFormatter.localizedString(byJoining: <#T##[String]#>)
//        case .urlAddresses:
//            <#code#>
//        case .familyName:
//            <#code#>
//        case .givenName:
//            <#code#>
//        case .middleName:
//            <#code#>
//        case .namePrefix:
//            <#code#>
//        case .nameSuffix:
//            <#code#>
//        case .nickname:
//            <#code#>
//        case .phoneticFamilyName:
//            <#code#>
//        case .phoneticGivenName:
//            <#code#>
//        case .phoneticMiddleName:
//            <#code#>
//        case .previousFamilyName:
//            <#code#>
//        case .phoneNumbers:
//            <#code#>
//        case .socialProfiles:
//            <#code#>
//        case .imageData:
//            <#code#>
//        case .imageDataAvailable:
//            <#code#>
//        case .thumnailData:
//            <#code#>
//        case .realtions:
//            <#code#>
        default: fatalError("BECAUSE FUCK YOU!")
        }
    }
    
    func matchesSearchText(_ text: String) -> (match: Bool, text: String?) {
        
        if departmentName.contains(text) {
            return (true, departmentName)
        } else if familyName.contains(text) {
            return (true, familyName)
        } else if givenName.contains(text) {
            return (true, givenName)
        } else if jobTitle.contains(text) {
            return (true, jobTitle)
        } else if middleName.contains(text) {
            return (true, middleName)
        } else if nickname.contains(text) {
            return (true, nickname)
        } else if organizationName.contains(text) {
            return (true, organizationName)
        } else if previousFamilyName.contains(text) {
            return (true, previousFamilyName)
        }
        
        for email in emailAddresses.map({ $0.address }) {
            if email.contains(text) {
                return (true, email)
            }
        }
        
        for imAddress in instantMessageAddresses.map({ $0.address }) {
            if imAddress.username.contains(text) {
                return (true, "\(imAddress.service): \(imAddress.username)")
            }
        }
        
        for number in phoneNumbers.map({ $0.phoneNumber }) {
            if number.stringValue.contains(text) {
                return (true, number.stringValue)
            }
        }
        
        for address in postalAddresses.map({ $0.address }) {
            let formatter = CNPostalAddressFormatter()
            formatter.style = .mailingAddress
            
            let textAddress = formatter.string(from: address)
            if textAddress.contains(text) {
                return (true, textAddress)
            }
        }
        
        for url in urlAddresses.map({ $0.address }) {
            if url.contains(text) {
                return (true, url)
            }
        }
        
        return (false, nil)
        
    }
    
}

extension Contact: Equatable {
    
    public static func == (lhs: Contact, rhs: Contact) -> Bool {
        return lhs.contact == rhs.contact
    }
    
}

public struct ContactGroup: Identifiable {
    
    public let contacts: [Contact]
    public let id: String
    
}

public struct SearchedContact: Identifiable, Equatable {
    
    public let contact: Contact
    public let id: String = UUID().uuidString
    public let text: String
    
}

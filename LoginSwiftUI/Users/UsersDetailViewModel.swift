import Foundation
import SwiftUI
import MapKit
import CoreLocation

struct Marker: Identifiable {
    let id = UUID()
    var location: MapMarker
}

protocol UsersDetailViewModelProtocol: ViewModelProtocol {
    var navigationBarTitle: String { get }
    var nameTitle: String { get }
    var usernameTitle: String { get }
    var emailTitle: String { get }
    var phoneTitle: String { get }
    var websiteTitle: String { get }
    var cityTitle: String { get }
    var streetTitle: String { get }
    var suiteTitle: String { get }
    var zipcodeTitle: String { get }
    var companyTitle: String { get }
    var catchPhraseTitle: String { get }
    var bsTitle: String { get }
    
    var user: User? { get set }
    var region: MKCoordinateRegion { get set }
    var marker: Marker { get set }
}

class UsersDetailViewModel: UsersDetailViewModelProtocol {
    
    let navigationBarTitle = "User Details"
    let nameTitle = "Name: "
    let usernameTitle = "Username: "
    let emailTitle = "Email: "
    let phoneTitle = "Phone: "
    let websiteTitle = "Website: "
    let cityTitle = "City: "
    let streetTitle = "Street: "
    let suiteTitle = "Suite: "
    let zipcodeTitle = "Zipcode: "
    let companyTitle = "Company: "
    let catchPhraseTitle = "Catch Phrase: "
    let bsTitle = "Bs: "
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.9, longitudeDelta: 0.9))
    @Published var marker = Marker(location: MapMarker(coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), tint: .green))
    
    
    var user: User? = nil
    
    required init() {
    }
    
    required init(user: User) {
        self.user = user
        if let latitudeString = self.user?.address.geo.lat,
           let longitudeString = self.user?.address.geo.lng,
           let latitude = Double(latitudeString),
           let longitude = Double(longitudeString) {
            self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: MKCoordinateSpan(latitudeDelta: 0.9, longitudeDelta: 0.9))
            self.marker = Marker(location: MapMarker(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), tint: .green))
        }
    }
}

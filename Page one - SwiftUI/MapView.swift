//
//  MapView.swift
//  Page one - SwiftUI
//
//  Created by Jon Mikael Skaug on 29/05/2022.
//

import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI

struct MyAnnotationItem: Identifiable {
    var coordinate: CLLocationCoordinate2D
    let id = UUID()
}



struct MapView: View {
    let location: MapLocation
    
    @State private var region = MKCoordinateRegion(
          center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
          span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
      )

      let locations: [MapLocation] = [
          MapLocation(latitude: 37.7749, longitude: -122.4194, title: "San Francisco"),
          MapLocation(latitude: 34.0522, longitude: -118.2437, title: "Los Angeles")
   
      ]

  
    
    var body: some View {
            Map(coordinateRegion: $region, annotationItems: locations) { location in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                    MapView(location: location)
                }
            }
        }
    }
 



struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(location: MapLocation.init(latitude: 37.7749, longitude: -122.4194, title: "San Francisco"))
        MapView(location: MapLocation.init(latitude: 37.7749, longitude: -122.4194, title: "San Francisco")).preferredColorScheme(.dark)
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()

    @Published var location: CLLocationCoordinate2D?

    override init() {
        super.init()
        manager.delegate = self
    }

    func requestLocation() {
        manager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
}

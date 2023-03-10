//
//  ContentView.swift
//  Zaza Hunter
//
//  Created by caden christesen on 2/22/23.
//

import SwiftUI
import MapKit
struct ContentView: View {
     @StateObject var locationManager = LocationManager()
     @State private var userTrackingMode: MapUserTrackingMode = .follow
     @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.0558, longitude: -87.6743), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
     @State private var places = [Place]()
     var body: some View {
         Map(coordinateRegion: $region,
             interactionModes: .all,
             showsUserLocation: true,
             userTrackingMode: $userTrackingMode,
             annotationItems: places) { place in
             MapPin(coordinate: place.annotation.coordinate)
         }
             .onAppear() {
                 performSearch(item: "Pizza")
             }
     }

     func performSearch(item: String) {
         let searchRequest = MKLocalSearch.Request()
         searchRequest.naturalLanguageQuery = item
         searchRequest.region = region
         let search = MKLocalSearch(request: searchRequest)
         search.start { response, error in
             if let response = response {
                 for mapItem in response.mapItems {
                     let annotation = MKPointAnnotation()
                     annotation.coordinate = mapItem.placemark.coordinate
                     annotation.title = mapItem.name
                     places.append(Place(annotation: annotation, mapItem: mapItem))
                 }
             }
         }
     }
 }

 @@ -25,3 +49,9 @@ struct ContentView_Previews: PreviewProvider {
         ContentView()
     }
 }

 struct Place: Identifiable {
     let id = UUID()
     let annotation: MKPointAnnotation
     let mapItem: MKMapItem
 }

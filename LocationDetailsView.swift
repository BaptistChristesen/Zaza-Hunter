//
//  LocationDetailsView.swift
//  Zaza Hunter
//
//  Created by caden christesen on 2/22/23.
//

import SwiftUI
import MapKit
 struct LocationDetailsView: View {
     var selectedMapItem: MKMapItem
     var body: some View {
         let address = selectedMapItem.placemark.subThoroughfare! + " " +    // street address number
         selectedMapItem.placemark.thoroughfare! + "\n" +                    // street name
         selectedMapItem.placemark.locality! + ", " +                        // city
         selectedMapItem.placemark.administrativeArea! + " " +               // state
         selectedMapItem.placemark.postalCode!                               // zip code
         VStack {
             Text(selectedMapItem.name!)
                 .font(.title)
             Text(address)
             Text(selectedMapItem.phoneNumber!)
                 .padding()
             Link(destination: selectedMapItem.url!) {
                 Text("Website")
                     .padding()
             }
             Button {
                 let latitude = selectedMapItem.placemark.coordinate.latitude
                 let longitude = selectedMapItem.placemark.coordinate.longitude
                 let url = URL(string: "maps://?daddr=\(latitude),\(longitude)")
                 if UIApplication.shared.canOpenURL(url!) {
                     UIApplication.shared.open(url!, options: [:])
                 }
             } label: {
                 Text("Directions")
             }
         }
     }
 }
struct LocationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailsView(selectedMapItem: MKMapItem())
    }
}

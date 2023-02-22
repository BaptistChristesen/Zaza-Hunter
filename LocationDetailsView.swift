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
        VStack {
            Text(selectedMapItem.name!)
                .font(.title)
        }
    }
}

struct LocationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailsView(selectedMapItem: MKMapItem())
    }
}

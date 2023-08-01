//
//  ContentView.swift
//  lab2week2
//
//  Created by Ghada Al on 13/01/1445 AH.
//

import SwiftUI


struct CardData: Identifiable {
    let id: UUID = UUID()
    let title: String
    let subtitle: String
    let price: Int
    let imageURL: URL?
}
struct CardView: View {
    let data: CardData
    var body: some View {
        GeometryReader{ geometryProxy in
        
        
        ZStack {
            AsyncImage(url: data.imageURL) { result in
                if let image = result.image {
                    image
                       .resizable()
                        .scaledToFill()
                } else {
                    Rectangle()
                        .fill(Color.black.opacity(0.1))
                    
                    
                }
            }
            .frame(
        width: geometryProxy.size.width,
        height: geometryProxy.size.height
            )
        }
            .frame(height: 300)
            .clipped()
            VStack{
                Spacer()
                Text(data.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(data.subtitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            
       

        }
        
    }
    
    
}

struct ContentView: View {
    let categories: Array<String> = [
        "Rooms",
        "Views",
        "Beach",
        " Caves"
    ]
    @State private var iswhite = false
    @State private var isdark = true
    
    let cards: Array<CardData> = Array(
        repeating: CardData (
            title: "Title",
            subtitle: "Description",
            price: 10,
            imageURL: URL(string: "https://source.unsplash.com/200x200/?hotelroom"))
        ,count: 10
    )
    var body: some View {
        NavigationView{
        ScrollView{
            HStack {
                Image("icons8-search-30")
                          Text("Where to go?")
                          TextField("Any where, Any week. add guest", text: .constant(""))
                               .frame(height: 40)
                               .frame(maxWidth: .infinity, alignment: .top)
                               .foregroundColor(.black)
                            
                   
            }
            .padding(.vertical, 10)
                  .padding(.horizontal, 9)
                  .background(Color.black.opacity(0.1))
                  .cornerRadius(32)
         
  
            
            HStack {
                ForEach(categories, id: \.self) { category in
                    Button(action: {
                        
                        
                    }, label: {
                    Text(category)
                           
                            .padding(.vertical, 21)
                            .padding(.horizontal, 22)
                            .background(Color.black.opacity(0.1))
                            .cornerRadius(12)
                            .foregroundColor(.black)
                            .font(.system(size: 17))
                            
                           
                            
                        
                    }
                      )
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
            // Headline Card
        .clipped()
            ZStack {
              CardView(data: CardData(title: "", subtitle: "", price: 0, imageURL: URL(string: "https://www.venuereport.com/media/cache/resolve/venue_roundup_single_image_flex/uploads/+0Regular_Roundup/Glam-Bookable/BeauRivagePalace-01.jpg") ))
//
            }
         
   
            HStack {
            
                NavigationLink( destination: {
                    Text("you can the details of rooms here")
                }, label: {
                    Text("check the available room")
                        .foregroundColor(.black)
                        .bold()
                        .font(.system(size: 20))
                }
               )
            }
           
    
            ScrollView(.horizontal) {
            
                HStack {
                 
                    ForEach(cards) { card in CardView(data: CardData(title: "", subtitle: "", price: 0, imageURL: URL(string: "https://source.unsplash.com/200x200/?room") ))
       
                        .frame(width: 300, height: 150)
                    }
                }
              


                      .padding()
//
//   .frame(width: 200, height: 150)
//
//
//                }
             
               
                
            }
            Spacer()
        }
        
     
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
     

    
}
  
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            //.environment(\.colorScheme, .dark)
            //.preferredColorScheme(.dark)
           // .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}



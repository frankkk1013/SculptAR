//
//  File.swift
//  wwdc_3
//
//  Created by Francesco Iaccarino on 11/04/22.
//

import Foundation
import SwiftUI

struct Statue: Identifiable{
    var id = UUID()
    var name : String
}

struct Menu: View {

    @State var tapped: Bool = false
    @State var name: String = ""
    
    
    var body: some View {
        NavigationView{
            
            VStack{
                Spacer()
                HStack{
                    item(name: "David")
                        .scaleEffect(tapped ? 1.2 : 1)
                        .animation(.spring(response: 0.4, dampingFraction: 0.6))
                        .onTapGesture {
                            self.name = "David"
                            self.tapped.toggle()
                            
                            
                        }.padding(.trailing).scaledToFit()
                    
                    
                    
                }.padding()
                
                Spacer()
                NavigationLink("", isActive: $tapped) {
                    //                    Details()
                    ContentView(name: name)
                }
                
                
            }.frame(maxHeight: .infinity,alignment: .topLeading)
                .navigationTitle("Italian sculptures")
                .navigationBarTitleDisplayMode(.large)
                .padding(.top)
                .padding(.leading)
                .padding(.trailing)
            
        }.navigationViewStyle(.stack)
        
        
            .navigationBarHidden(false)
        
    }
}

struct item: View{
    var name : String
    
    var body : some View{
        
        VStack(alignment : .leading){
            
            ZStack(alignment: .center){
                Image(uiImage: UIImage(named: name + ".jpg")!).resizable().scaledToFit().cornerRadius(12)
                
                HStack{
                    Spacer()
                    
                    VStack{
                        
                        Text("The Davids").foregroundColor(.white).font(.largeTitle).bold().shadow(radius: 30)
                            .padding(.top, 90)
                        Spacer()
                        
                    }.padding()
                    
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    
                    VStack{
                        Image(uiImage: UIImage(named: "BadgeAR")!)
                            .resizable().scaledToFit().cornerRadius(3).background(Color.white.opacity(0.5)).opacity(0.6)
                            .frame(width: 80, alignment: .trailing).background(Color.gray).cornerRadius(12).padding()
                        
                        Spacer()
                        
                    }
                }
                
                
                
                
            }.frame(width: 470)
            
            Text("King David of Israel was a prominent figure in Abrahamic religions. David has been portrayed in a myriad of ways in the arts. The two  statues may have all been crafted Italy, but each remain vastly different, displaying different themes and influences from the time period they were exhibited in.\nLet’s take a dive into.  ").colorInvert().font(.body).padding(.top)
            
            
            
            
            
        }.padding()
            .frame(width: 526)
            
            
            
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.accentColor).shadow(color: .accentColor, radius: 50, x: 0, y: 0)
                    .frame(width: 550)
                    
            )
        
        
        
        
    }
}

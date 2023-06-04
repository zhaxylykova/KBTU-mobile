//
//  SocialsView.swift
//  KBTU Mobile
//
//  Created by Karina Abubakirova on 23.05.2023.
//

import SwiftUI

struct SocialMediaLink: Identifiable {
    let id = UUID()
    let name: String
    let url: URL
    let iconName: String
}

struct SocialsView: View {
    let socialMediaLinks = [
        SocialMediaLink(name: "@kbtu_official", url: URL(string: "https://instagram.com/kbtu_official/")!, iconName: "ic_instagram"),
        SocialMediaLink(name: "@kbtu_postgraduate", url: URL(string: "https://instagram.com/kbtu_postgraduate/")!, iconName: "ic_instagram"),
        SocialMediaLink(name: "@exedkbtu", url: URL(string: "https://instagram.com/exedkbtu/")!, iconName: "ic_instagram"),
        SocialMediaLink(name: "Facebook", url: URL(string: "https://www.facebook.com/kbtuofficial")!, iconName: "ic_facebook"),
        SocialMediaLink(name: "Telegram", url: URL(string: "https://t.me/kbtunews")!, iconName: "ic_telegram"),
        SocialMediaLink(name: "Youtube", url: URL(string: "https://www.youtube.com/channel/UCMRF1_QzLIRx5E9wv-a-vCw")!, iconName: "ic_youtube"),
        SocialMediaLink(name: "Tiktok", url: URL(string: "https://www.tiktok.com/@kbtu_official/")!, iconName: "ic_tiktok"),
        SocialMediaLink(name: "KBTU website", url: URL(string: "https://kbtu.edu.kz/")!, iconName: "ic_web"),
    ]
    
    var body: some View {
        VStack {
            ZStack {
                List(socialMediaLinks) { link in
                    Link(destination: link.url) {
                        HStack {
                            Image(link.iconName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            
                            Text(link.name)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Image(systemName: "arrow.up.right.square")
                                .foregroundColor(.blue)
                        }
                        .padding()
                    }
                }
                //.background(Color.white)
            }
            .navigationTitle("Socials")
            .background(Color("backgroundColor"))
        }
        .background(Color("backgroundColor"))
    }
}

struct SocialsView_Previews: PreviewProvider {
    static var previews: some View {
        SocialsView()
    }
}



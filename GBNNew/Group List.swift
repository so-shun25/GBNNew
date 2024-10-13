//
//  Group List.swift
//  GBNNew
//
//  Created by 曽世田隼季 on 2024/10/13.
//

import SwiftUI

struct Group_List: View {
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach((0...79), id: \.self) {
                        let codepoint = $0 + 0x1f600
                        let codepointString = String(format: "%02X", codepoint)
                        Text("\(codepointString)")
                        let emoji = String(Character(UnicodeScalar(codepoint)!))
                        Text("\(emoji)")
                    }
                }.font(.largeTitle)
            }
            .navigationTitle("グループ一覧")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink("追加", destination: NewGroup())
                    }
                }
            }
            
        }
        
    }


#Preview {
    Group_List()
}

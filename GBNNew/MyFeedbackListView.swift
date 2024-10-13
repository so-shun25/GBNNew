//
//  MyFeedbackListView.swift
//  GBNNew
//
//  Created by 曽世田隼季 on 2024/09/14.
//

import SwiftUI
import Foundation
import SwiftData


struct MyFeedbackListView: View {
    
    
    @Environment(\.modelContext) private var context
    @Query private var gbns: [GBN]
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(gbns) { gbn in
                    NavigationLink{
                        FeedbackView(gbn: gbn)
                    }label: {
                        Text(gbn.title)
                    }
                    
                }
            }.toolbar{
                ToolbarItem{
                    Button("追加"){
                        add(title: "名称未設定", good: "", bad: "", next: "", other: "")
                    }
                }
            }.navigationTitle("GBN")
        }
    }
    private func add(title: String, good: String, bad: String, next: String, other: String) {
        let data = GBN(title: title, good: good, bad: bad, next: next, other: other)
        context.insert(data)
    }

    // データの削除
    private func delete(gbn: GBN) {
        context.delete(gbn)
    }

    // データのアップデート
    private func update() {
        try? context.save()
    }
}

#Preview {
    MyFeedbackListView()
}
@Model
final class GBN {
    var title: String
    var good: String
    var bad: String
    var next: String
    var other: String

    init(title: String, good: String, bad: String, next: String, other: String ) {
        self.title = title
        self.good = good
        self.bad = bad
        self.next = next
        self.other = other
    }
    
    
    
    
}

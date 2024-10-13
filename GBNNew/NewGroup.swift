//
//  NewGroup.swift
//  GBNNew
//
//  Created by 曽世田隼季 on 2024/10/13.
//

import SwiftUI

struct NewGroup: View {
    @State private var inputText: String = ""  // 入力されるテキストを管理する状態変数
    @State private var items: [String] = ["アイテム1", "アイテム2", "アイテム3"]  // ダミーのリストアイテム
    
    var body: some View {
        VStack {
            // タイトル部分
            Text("新規グループ作成")
                .font(.largeTitle)
                .padding()
            
            // リスト部分
            List(items, id: \.self) { item in
                Text(item)
            }
            .padding()
            
            // 入力とボタン部分
            HStack {
                TextField("グループ名を入力", text: $inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    // 作成ボタンが押された時の処理
                    if !inputText.isEmpty {
                        items.append(inputText)  // リストに新しい項目を追加
                        inputText = ""  // 入力フィールドをクリア
                    }
                }) {
                    Text("作成")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
            }
        }
        .padding()
    }
    
}

#Preview {
    NewGroup()
}

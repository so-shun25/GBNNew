//
//  ContentView.swift
//  GBNNew
//
//  Created by 曽世田隼季 on 2024/09/14.
//

import SwiftUI

struct FeedbackView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    
    @State var text1: String = ""
    @State var text2: String = ""
    @State var text3: String = ""
    @State var text4: String = ""
    @State var title: String = "Title"  // タイトルを管理する状態変数
    let gbn: GBN
    @State private var showAlert = false
    @State private var AlertD = false
    
    var body: some View {
        NavigationStack{
            VStack {
                TextField("タイトルを入力してください", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                List {
                    Section("G") {
                        TextField("良かったところ", text: $text1, axis: .vertical)
                    }
                    Section("B") {
                        TextField("悪かったところ", text: $text2, axis: .vertical)
                    }
                    Section("N") {
                        TextField("次にやること", text: $text3, axis: .vertical)
                    }
                    Section("その他") {
                        TextField("///", text: $text4, axis: .vertical)
                    }
                }
                  // タイトルを表示
                
                Button("Save") {
                    update()
                    showAlert = true
                }
                Button("Delete"){
                    AlertD = true
                }
                .padding()
            }
            .alert("保存完了", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text("保存できました。")
            }
            .alert(isPresented: $AlertD) {
                            Alert(
                                title: Text("削除"),
                                message: Text("削除しますか"),
                                primaryButton: .default(Text("OK"), action: {
                                    delete(gbn: gbn)
                                    dismiss()
                                    
                                }),
                                secondaryButton: .cancel(Text("Cancel"), action: {
                                    print("Cancel tapped")
                                })
                            )
                        }
            .onAppear {
                title = gbn.title
                text1 = gbn.good
                text2 = gbn.bad
                text3 = gbn.next
                text4 = gbn.other
                
            }
        }
        .onChange(of: title) {
            gbn.title = title
        }
        .onChange(of: text1) {
            gbn.good = text1
        }
        .onChange(of: text2) {
            gbn.bad = text2
        }
        .onChange(of: text3) {
            gbn.next = text3
        }
        .onChange(of: text4) {
            gbn.other = text4
        }



        
    }
    
    private func update() {
        try? context.save()
    }
    private func delete(gbn: GBN) {
        context.delete(gbn)
    }
    
    
}

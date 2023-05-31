//
//  ContentView.swift
//  Bookworm
//
//  Created by Boris R on 29/05/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author)
    ]) var books: FetchedResults<Book> // propriedade de solicitaca de busca
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List{
                ForEach (books) { book in
                    NavigationLink {
                        DetailView(book: book)
                    }label: {
                        HStack{
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            VStack(alignment: .leading){
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                Text(book.author ?? "Unknown Title")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deletBooKs)
            }
                .navigationTitle("Bookwnrm")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading){
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add Book", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                }
         }
    }
    func deletBooKs(at offsets: IndexSet) {
        for offset in offsets {
            // procurar o livro
            let book = books[offset]
            
            // deleta o livro
            moc.delete(book)
        }
        
        //sava o contexto
        try? moc.save()
        }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

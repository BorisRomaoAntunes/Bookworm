//
//  AddBookView.swift
//  Bookworm
//
//  Created by Boris R on 30/05/23.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc // propriedade de ambiente para armazenar nosso contexto objeto gerenciado
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Name of Book: ", text: $title)
                    TextField("Name of author: ", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                    }
                }
                Section{
                    
                    TextEditor(text: $review)
                    HStack{
                        
                        Picker("Rating", selection: $rating){
                            ForEach(0..<6){
                                Text(String($0))
                            }
                        }
                        RatingView(rating: $rating)
                    }
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    Button("Salve"){
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review
                        
                        try? moc.save()
                        dismiss()
                    }
                }
                
            }
            .navigationTitle("Add Book")
        }
        
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}

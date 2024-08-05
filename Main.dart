class Book {
  String title;
  String author;
  int yearPublished;
  bool isCheckedOut;


  Book(this.title, this.author, this.yearPublished, this.isCheckedOut);

  Book.unknownAuthor(this.title, this.yearPublished)
      : author = 'Unknown',
        isCheckedOut = false;

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      map['title'],
      map['author'],
      map['yearPublished'],
      map['isCheckedOut'],
    );
  }
}

typedef BookFilter = bool Function(Book book);

 filterBooks(List<Book> books, BookFilter filter) {
  return books.where(filter).toList();
}
int countCheckedOutBooks(List<Book> books) {
  return books.fold(0, (count, book) => book.isCheckedOut ? count + 1 : count);
}

int totalBooksPublishedAfter(List<Book> books, int year) {
  return books.fold(0, (total, book) => book.yearPublished > year ? total + 1 : total);
}

 filterBooksByAuthor(List<Book> books, String author) {
  return books.where((book) => book.author == author).toList();
}

 getBookTitles(List<Book> books) {
  return books.map((book) => book.title).toList();
}

void printBookDetails(List<Book> books) {
  books.forEach((book) {
    print('Title: ${book.title}, Author: ${book.author}, Year: ${book.yearPublished}, Checked Out: ${book.isCheckedOut}');
  });
}
String getBookStatus(Book? book) {
  if (book == null) {
    return 'Status Unknown';
  } else if (book.isCheckedOut) {
    return 'Checked Out';
  } else {
    return 'Available';
  }
} 

//  switch (book?.isCheckedOut) {
//     case true:
//       return 'Checked Out';
//     case false:
//       return 'Available';
//     default:
//       return 'Status Unknown';
//   }

void main() {
  List<Book> books = [
    Book('1984', 'George Orwell', 1949, true),
    Book('Brave New World', 'Aldols Huxley', 1932, true),
    Book('Fahrenheit 451', 'Ray Bradbury', 1953, true),
    Book.unknownAuthor('The Catcher in the Rye', 1951),
    Book.fromMap({
      'title': 'To Kill a Mockingbird',
      'author': 'Harper Lee',
      'yearPublished': 1960,
      'isCheckedOut': false,
    }),
  ];

  // print('Total Checked Out Books: ${countCheckedOutBooks(books)}');
  // print('Total Books Published After 1950: ${totalBooksPublishedAfter(books, 1950)}');

  //  print('Books by Harper Lee:');
  //  List<Book> harperLeeBooks = filterBooksByAuthor(books, 'Harper Lee');
  //  printBookDetails(harperLeeBooks);

  // print('Book Titles:');
  // List<String> bookTitles = getBookTitles(books);
  // bookTitles.forEach(print);

  // print('Book Status:');
  // books.forEach((book) => print('${book.title}: ${getBookStatus(book)}'));
}


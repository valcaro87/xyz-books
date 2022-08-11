## System Specification
* XYZ Books developed an application that can get information from students, college textbooks, and other course material. It has functionalities like displaying applicable product data (e.g., authors, publishers, etc) or converting an ISBN (i.e., International Standard Book Number) to and from different formats. 

* I Created a simple UI that displays information about a particular book given its ISBN-13 or 10.
An input field (search bar) for navigating to other book pages. The element accept both ISBN-13 and ISBN-10 values. 
A function that converts an ISBN-13 to an ISBN-10 (and vice versa).

#### Back-End API: 
* An API endpoint to display information about a particular book given its ISBN-13 (i.e., via
a GET call to an API where the ISBN-13 is provided in the URL path as the id). The response body should be in
JSON format for all successful (i.e., status code 200) responses.

* A schema and corresponding classes to represent an author, book, and publisher with the following constraints:
###### Author
* Should always have a first name and last name.
* Can have a middle name/initial, but is not required.
* Can have many books.
###### Book
* Should always have a title, ISBN-13, list price, publication year, and publisher.
* Can have an image URL and edition.
* Must have at least one author but can have many authors.
###### Publisher
* Should always have a name.
* Can have many books.

Notes: 
* All authors of the book should be combined and provided as a single, comma-separated string (e.g., “author
1, author 2, author 3”).
* The publisher’s name should be provided as an unnested object.
* The response code for a book that does not exist should be a 404.
* The response code for a request with an invalid ISBN-13 should be 400. For this condition, you will likely
need to utilize some of the code from item #3 below.


### API Endpoints:
* Test using Postman API Platform
* GET: search ISBN (id = isbn)
* url: {host}/api/v1/books/{id}

examples: 
* https://xyz-books-isbn.herokuapp.com/api/v1/books/1643650068
* localhost:3000/api/v1/books/9781466396715

#### CRUD Books: 
* https://xyz-books-isbn.herokuapp.com

#### Gem 'isbn'
* An existing library was installed  for isbn10/13 validation: https://github.com/tkersey/isbn

### Instructions:

* open terminal, clone repo: *git clone https://github.com/valcaro87/xyz-books.git

* change directory: *cd xyz-books
* then run: *bundle install*
* ( you may try to delete file: *Gemfile.lock*, to generate a new one)

* open file '*database.yml*' - edit/change username and password, based from your local machine
  * grant the user to access all privileges and permissions on the database(postgreSql)

* run: *rails db:setup*
* run: *rails db:migrate*
* run: *rails s*


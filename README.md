# INSTRUCTIONS

* open terminal, clone repo: *git clone https://github.com/valcaro87/xyz-books.git

* change directory: *cd xyz-books
* delete file: *Gemfile.lock*, then run: *bundle install*

* open file '*database.yml*' - edit/change username and password, based from your local machine
  * make sure or grant the user to access all privileges and permissions on the database(postgreSql)

* run: *rails db:setup*
* run: *rails db:migrate*
* run: *rails s*

## Endpoints:
Test using Postman API Platform

GET: search ISBN (id = isbn)
url: {host}/api/v1/books/{id}

examples: 
* https://xyz-books-isbn.herokuapp.com/api/v1/books/1643650068
* localhost:3000/api/v1/books/9781466396715


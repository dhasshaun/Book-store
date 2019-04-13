# Book-store
Just simply book store using ROR api mode and swagger for its documents

<b>Using Ruby version</b>
'2.4.0'

<b>Please following these steps...</b>

1. Clone me.
2. Install Ruby version 2.4.0
3. Get inside the project and do ```bundle install```
4. Running these commands in order <br />
    ```rake db:create``` to create database <br />
    ```rake db:migrate``` to migrate database fields <br />
    ```rake db:seed``` to seed books data <br />
    ```rake rswag:specs:swaggerize``` to generate API document for this app 
5. Running app by using this command ```rails s```
6. This app using Swagger API Docs which is set to run on 'http:localhost:3000/api-docs/index.html'


<b>Units test</b>

  By runing ```rspec spec/units/*```
  
  
<b>Remark</b>

  This app using PostgreSQL

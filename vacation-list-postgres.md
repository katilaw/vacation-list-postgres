### Instructions

Build a vacation list app that reads and writes information to a PostegreSQL database.

### Getting Set Up

* Install the necessary dependencies: `bundle`
* Create a database called `vacation_list_development`.
* Define your tables in a `schema.sql` file.
* Create tables by running `psql vacation_list_development < schema.sql` at the command line.
* Start the server: `ruby app.rb`

### Requirements Necessary to Meet Expectations

* Visiting `GET /vacations` should display the index page for vacations. This page should contain a list of vacations read from the database, as well as a form for adding a new vacation.
* The name of each vacation must be in [an `<li>` element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/li)
* The form to add a new vacation requires that the name be specified.
* If the vacation is left blank when the form is submitted...
  - A new vacation destination record **should NOT** be saved to the database.
  - The user should see the index page for vacations.
* The form should submit to `POST /vacations`, which will save the new destination to the database.
* Modify your app so vacations destinations have comments. Modify your `schema.sql` file to create a new table for comments. Feel free to add a `DROP TABLES` line, so you can re-run your schema repeatedly.
* Create a `data.sql` file. Write SQL statements to insert a vacation destination, as well as insert two or more comments for that vacation destination in the `data.sql` file. Add these records to the database by running the following command: `psql vacation_list < data.sql`
* Clicking on a vacation destination takes you to `GET /vacations/:id`.
* Visiting `GET /vacations/:id` should display the name of the vacation, a list of comments on the vacation.
* The list of comments **must** be retrieved using a SQL `JOIN` statement.

Acceptance tests have been written for you that cover these requirements. Run `rspec` to run the test suite and implement code to make these tests pass.

### Tips

* To meet expectations, all the requirements specified above must be met. It is possible to make all the tests pass, but not satisfy the requirements above, so please double-check the requirements once you are done.
* If your rspec tests are failing, read the test files themselves closely. Make sure your schema names the table columns in the same way that the test is trying to read them.
* **DO NOT** start the requirements necessary to exceed expectations before completing the requirements necessary to meet expectations.

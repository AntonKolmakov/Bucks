# README

- The application contains two pages: / and / admin
- The page / displays the current dollar to ruble exchange rate, known
application.
- The application with a background script periodically updates the course from any
your available source (CBR website, home page
http://www.rbc.ru, etc.).
- When updating a course in the application, it is updated on all open in
current pages.
- On the / admin page there is a form containing a field for entering a number,
field for entering date-time and submit.
- When submitting, the entered number is made a forced course to the entered
time, i.e. until this time, the real rate is ignored, instead
pages / displays the forced rate.
- The / admin page “remembers” the values ​​entered the previous time, they
appear already entered when the page loads.
- When submitting a forced course, it, of course, is immediately updated at all
open pages. When the forced time expires
course on all pages the real course begins to be displayed.
- The form contains reasonable validations.
- The appearance of the application must be accurate within a reasonable
(e.g. use Twitter Bootstrap).
- The advantage will be the use of any JS-framework on the client
side.
- The web application should work correctly in Firefox and Chrome browsers
latest versions.
- The code should be covered by tests.
- Everything needed to run the application locally must be
framed as a Procfile for Foreman.
1. Refactor the `_form.html.erb` partial to accept the argument to the `form_for` helper as a local.  You'll also need to change the `new.html.erb` and `edit.html.erb` views as well.
- create and edit form create form directly renders the form in a students/form partial with the form object passed through as a local variable
- create and edit form edit form directly renders the form in a students/form partial with the form object passed through as a local variable

2. Refactor the `_student.html.erb` partial to pass through each rendered student as a local.
- show_view renders a students/student partial

3. On the classroom show page, iterate through each classroom's students and display each of them using our `_student.html.erb` partial with locals.
- classroom_show_view renders classroom information on the show view
- classroom_show_view renders a partial that only contains classroom (not student) information
- classroom_show_view renders a students/student partial
- classroom_show_view displays the student information from the partial

4. Create a `_classroom.html.erb` partial to display classroom information on the classroom show page.

5. Add in search functionality such that users can search for a student by name and see all matching results on the students index page. The results should be displayed by rendering a `students/_student.html.erb` partial.
- Student search when it receives an empty search argument returns all students
- Student search when it receives a search query returns all students whose names contain the given string
- Student search when it receives a search query returns all students whose names contain the given string
- Student search when it receives a search query renders the results with a partial



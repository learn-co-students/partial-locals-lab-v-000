[x] Refactor the `_form.html.erb` partial to accept the argument to the `form_for` helper as a local.  You'll also need to change the `new.html.erb` and `edit.html.erb` views as well.

[x] Refactor the `_student.html.erb` partial to pass through each rendered student as a local.

[x] On the classroom show page, iterate through each classroom's students and display each of them using our `_student.html.erb` partial with locals.

[ ] Create a `_classroom.html.erb` partial to display classroom information on the classroom show page.

[x] Add in search functionality such that users can search for a student by name and see all matching results on the students index page. The results should be displayed by rendering a `students/_student.html.erb` partial.



Spec steps


[x] views/student_new
[x] views/student_show
[x] views/student_index
[] views/classroom_show

[x] model/student_spec - I should've done this first


	
		
		<% Student.search(student).map {|s| s.name).to match_array } %>


<% if @students.blank? %>
  <h4>There are no students matching this name <%= params[:term] %>.</h4>
<% end %>
 

<% @students.each do |student| %>


	<%= render partial: 'student', locals: {student: student} %>
<% end %>

.search {| student | student.map {|s| s.name).to_match }



Confused: 

Question: what would I call this in the controller? Not one of the 7 RESTful conventions? 

Also: how does the searching get done? How does the name submitted in the form get run through the db? 


   <%= link_to "Search Again", students_path %>        

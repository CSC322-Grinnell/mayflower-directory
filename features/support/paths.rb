module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    #This should be working but it isn't, used workaround below
    #when /^the user details page for \"(.*)\"/i 
     #path_to(ProfilesController.show($1)) 
     
    when /^the edit page for \"(.*)\"/i
      edit_student_path(Student.find_by_Student_Name($1))
    when /^the edit user page for \"(.*)\"/i
      edit_user_path(User.find_by_name($1))
      
    when /^the user details page for Joseph Nice$/ then '/profiles/1'
    when /^the user details page for Baddest User$/ then '/profiles/2'
    when /^the user details page for Laddy Buck$/ then '/profiles/3'
    when /^the edit details page for Joseph Nice$/ then '/profiles/1/edit'
    when /^the text page$/ then '/text'
    when /^the home page$/ then '/home'
    when /^the search page$/ then '/'
    when /^the help page$/ then '/static_pages/help'
    when /^the about page$/ then '/static_pages/about'
    when /^the signup page$/ then "/auth/register/cmon_let_me_in"
    when /^the new user page$/ then '/auth/register/sign_up'
    when /^the login page$/ then user_session_path
    when /^the users page$/ then '/static_pages/display'
    when /^the new resident page$/ then '/profiles/new'
    when /^the change password page$/ then '/auth/register/edit'
  
 
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)

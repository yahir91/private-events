module ApplicationHelper
  def logged_in
    if(current_user)
      link_to 'Log out', logout_path
    else
      link_to 'Log in', login_path
    end
  end
  def signup 
    if(current_user)
      link_to 'New Event', new_event_path
    else
      link_to 'Sign up', signup_path
    end
  end
  def show_user
    "Hello #{current_user.name}"
  end
end

module UsersHelper

  def user_fields(form, user)
    render :partial => 'users/fields', :locals => { :f => form, :user => user }
  end

end

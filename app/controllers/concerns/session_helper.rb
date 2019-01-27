module SessionHelper
  extend ActiveSupport::Concern
  
  def after_sign_in_path_for(user)
    case user.class.name
    when "Instructor"
      instructors_path
    when "Student"
      students_path
    else
      root_path
    end
  end
  
  # def after_sign_out_path_for(user)
  #   binding.pry
  # end
  
  def current_user
    current_student || current_instructor
  end
  
end
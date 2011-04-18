class ApplicationController < ActionController::Base
 protect_from_forgery
 helper_method :admin?
 helper_method :auth_review?
 protected

 # def calculate_points(review,person_id)
 #   @review = review
 #   @person = Person.find(person_id)
 #
 #   @points = @person.points
 #   if @review.content.length > 150
 #     @points += 5
 #   elsif @review.content.length > 20
 #     @points +=1
 #   end
 #
 #   @person.points = @points
 #   @person.save
 # end
  def current_user
    current_person
  end

  helper_method :current_user

 def authorize
    unless admin?
      flash[:alert] = "Unauthorized Access, You Need To Log In First"
      redirect_to home_index_path
      false
    end
 end

 def authorize_review
     unless auth_review?
       flash[:alert] = "You are Trying to Make an Unauthorized Access!!"
       redirect_to home_index_path
       false
     end
  end

 def auth_review?
   access = false
   if person_signed_in?
     access = true
   end
   access
 end

 def admin?
   access = false
   if person_signed_in?
      if current_person.name == "admin"
        access = true
      end
   end
   access
 end

end
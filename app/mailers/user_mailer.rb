class UserMailer < ActionMailer::Base
  default :from => "manish.das@sproutify.com"

  def upload_email(person,video)
      @person = person
      @video = video
      # @url  = "http://example.com/login"
      mail(:to => person.email,
           :subject => "A Video has been Uploaded by #{person.name}")
    end

end

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "kukumlima@gmail.com",
  :password             => "Bry@nus!",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
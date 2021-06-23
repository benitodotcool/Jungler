class UserMailer < ApplicationMailer

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://jungler-thp.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def conversation_email_to_a(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user_a = user
  
    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://jungler-thp.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user_a.email, subject: 'Tu as un nouveau match Jungler!') 
  end

  def conversation_email_to_b(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user_b = user
  
    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://jungler-thp.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user_b.email, subject: 'Tu as un nouveau match Jungler!') 
  end

end

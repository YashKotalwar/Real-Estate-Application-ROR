class MessagesController < ApplicationController
  def email_agent
    agent = Agent.find(params[:agent_id])
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    message = params[:message]

    # Send the email using the mail library or a gem such as Action Mailer
    # ...

    flash[:success] = "Your message has been sent to #{agent.first_name}."
    redirect_to agent_path(agent)
  end
end

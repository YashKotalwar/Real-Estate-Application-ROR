class AgentMailer < ApplicationMailer
  def send_message(agent, message)
    @agent = agent
    @message = message
    mail(to: @agent.email, subject: 'New Message from your website')
  end

  def contact_agent
    @agent = Agent.find(params[:id])
  end

end

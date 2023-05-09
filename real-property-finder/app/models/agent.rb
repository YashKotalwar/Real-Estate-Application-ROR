# app/models/agent.rb
class Agent < ApplicationRecord
  has_many :messages, dependent: :destroy

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def full_name
    "#{first_name} #{last_name}"
  end
end

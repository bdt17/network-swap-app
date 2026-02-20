class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ONLY validate what exists in DB
  validates :email, presence: true, uniqueness: true
  validates :role, inclusion: { in: %w[tech manager admin] }, allow_nil: true

  # Network Swap relationships
  has_many :swap_tickets, dependent: :restrict_with_error
  has_many :drone_inspections, dependent: :restrict_with_error

  before_validation :normalize_email

  private

  def normalize_email
    self.email = email.strip.downcase if email.present?
  end
end

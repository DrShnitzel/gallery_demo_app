class User < ActiveRecord::Base
  attr_accessor :passwd
  attr_accessor :validate_passwd
  validates :passwd,
            if: -> { validate_passwd },
            length: { in: 4..64 },
            strict: true
  validates :email,
            length: { in: 6..64 },
            uniqueness: true,
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
              message: 'is not an email' },
            strict: true

  has_many :media_data, dependent: :destroy

  def self.registration(email, password)
    user = User.new(email: email)
    user.update_password(password)
    user
  end

  def update_password(password)
    self.validate_passwd = true
    self.passwd = password
    generate_salt
    self.passwd_hash = calculate_passwd_hash(passwd)
    generate_token
    save
  end

  def check_auth(password)
    passwd_hash == calculate_passwd_hash(password)
  end

  def change_token
    generate_token
    save
  end

  private

  def generate_token
    # You do not need to check uuid uniqueness because
    # probability that it is unique is sufficient. More likely
    # all computers will stop working tomorrow.
    self.token = SecureRandom.uuid
  end

  def generate_salt
    self.salt = BCrypt::Engine.generate_salt
  end

  def calculate_passwd_hash(password)
    BCrypt::Engine.hash_secret(password, salt)
  end
end

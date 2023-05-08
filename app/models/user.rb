class User < ApplicationRecord
    before_save {self.email = email.downcase}
    validates :username, presence: true,
              uniqueness: true,
              length: {minimum: 3, maximum: 25}
    VALID_EMAIL_REGEX = /[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+/
    validates :email, presence: true, uniqueness: {case_sensitive: false},
              length: {maximum: 25},
              format: {with: VALID_EMAIL_REGEX}
    has_many :articles
    has_secure_password
end
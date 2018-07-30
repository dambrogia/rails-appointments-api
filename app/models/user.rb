class User < ApplicationRecord
	# Encrypt password
	has_secure_password

	has_many :appointments, :dependent => :destroy
	has_many :guests, :through => :appointments


 	validates_presence_of :first_name, :last_name, :email, :password_digest
end

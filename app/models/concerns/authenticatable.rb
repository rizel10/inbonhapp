module Authenticatable
	extend ActiveSupport::Concern

	included do
		# Associations
		has_many :authentications, as: :authable, dependent: :destroy

		# Validations
		validates_presence_of :provider
		validates :uid, presence: true, uniqueness: true

		# Attribute accessors
		attr_accessor :created_auth
	end

	# Class methods
	module ClassMethods

		def sign_in!(auth_value, password, metadata={})
			resource = sign_in(auth_value, password, metadata)
			raise CustomException::Authentication::InvalidCredentials if resource.nil?
			return resource
		end

		def sign_in(auth_value, password, metadata={})
			resource = find_by_auth_values(auth_value)
			unless resource.nil?
				if attribute_names.include? "approved"
					return nil unless resource.approved?
				end

				if resource.valid_password? password
					resource.created_auth = resource.authentications.create!(metadata: metadata)
					return resource
				end
			end
			return nil
		end

		def find_by_auth_values(auth_value)
			resource = nil
			authentication_keys.each do |auth_key|
				resource = send("find_by_#{auth_key}", auth_value)
				break if resource
			end
			return resource
		end

		def authenticate_by_token(uid, client, access_token)
			resource = find_by_uid(uid)
			unless resource.nil?
				authentication = resource.authentications.find_by_client(client)
				if !authentication.nil? and Authentication.token_compare(access_token, authentication.encrypted_access_token)
					return resource
				end
			end
			return nil
		end

		def reset_password(email)
	    resource = find_by_uid!(email)
			min_length = Devise.password_length.first
			pass_len = min_length.even? ? min_length/2 : ((min_length/2) + 1)
			password = SecureRandom.hex(pass_len)
			resource.update!(password: password)
	    send_recovery_password_email(resource, password)
	  end

		private

			def send_recovery_password_email(resource, password)
				AuthMailer.send_recovery_password_email(resource, password).deliver_now
			end

	end

	# Instance methods
	def update_with_password!(params)
		self.update_with_password(params) || raise(ActiveRecord::RecordInvalid.new(self))
	end

	def bypass_sign_in(metadata={})
		self.created_auth = self.authentications.create!(metadata: metadata)
	end

	def email=(em)
		if provider == "email"
			self.uid = em
		end
		super
	end

	def register_device(client, device_id, os)
		auth = self.authentications.find_by_client!(client)
		auth.register_device(device_id, os)

	end

	def sign_out(client)
		auth  = self.authentications.find_by_client!(client)
		# raise CustomException::Authentication::InvalidClient if auth.nil?
		auth.destroy!
	end

end

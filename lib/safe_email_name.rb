require 'mail'
require 'active_support'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/string/filters' # squish

module SafeEmailName
  REMOVED_EMAIL_CHARACTERS = /[<>"]+/.freeze
  private_constant :REMOVED_EMAIL_CHARACTERS

  def safe_email_name(name, email)
    email = email.gsub(REMOVED_EMAIL_CHARACTERS, '')
    name = name.to_s.squish
    return email if name.blank?

    address = Mail::Address.new
    address.display_name = name
    address.address = email
    address.to_s
  end

  # Make method available as a class method as well.
  def self.included(base)
    base.extend(SafeEmailName)
  end
end

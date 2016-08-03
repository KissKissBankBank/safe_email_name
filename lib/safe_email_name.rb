require 'active_support'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/string/filters' # squish

module SafeEmailName
  def safe_email_name(name, email)
    escaped_chars = /["<>]/

    email = email.gsub(escaped_chars, '')
    name = (name || "").gsub(escaped_chars, '').squish
    if name.blank?
      email
    else
      "#{name} <#{email}>"
    end
  end

  # Make method available as a class method as well.
  def self.included(base)
    base.extend(SafeEmailName)
  end
end

module SafeEmailName
  def safe_email_name(name, email)
    escaped_chars = /["<>]/
    email = email.gsub(escaped_chars, '')
    name = name.gsub(escaped_chars, '')
    "#{name} <#{email}>"
  end

  # Make method available as a class method as well.
  def self.included(base)
    base.extend(SafeEmailName)
  end
end

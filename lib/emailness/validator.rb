module Emailness::Validator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if Emailness.valid?(value)

    record.errors.add attribute, (options[:message] || "is not a valid email")
  end
end

if defined?(ActiveRecord::Base)
end

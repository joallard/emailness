class Emailness::Validator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if Emailness.valid?(value)

    message = options[:message] || "is not a valid email"
    record.errors.add(attribute, :invalid, message: message)
  end

  module HelperMethods
    def validates_email_format_of(*attr_names)
      validates_with ::Emailness::Validator, _merge_attributes(attr_names)
    end
  end

  ActiveModel::Validations::HelperMethods.include(HelperMethods)
end

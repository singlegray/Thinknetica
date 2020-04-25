# frozen_string_literal: true

module Acсessors
  def attr_accessor_with_history(*attributes)
    attributes.each do |attribute|
      attribute_var = "@#{attribute}".to_sym
      history_var = "@#{attribute}_history".to_sym
      define_method(attribute) { instance_variable_get(attribute_var) }
      define_method("#{attribute}_history".to_sym) { instance_variable_get(history_var) }

      define_method("#{attribute}=".to_sym) do |value|
        if instance_variable_get(history_var).nil?
          instance_variable_set(history_var, [])
        else
          previous_value = instance_variable_get(attribute_var)
          history = instance_variable_get(history_var)
          history << previous_value
        end
        instance_variable_set(attribute_var, value)
      end
    end
  end

  def strong_attr_accessor(attribute, class_name)
    attribute_var = "@#{attribute}".to_sym
    define_method(attribute) { instance_variable_get(attribute_var) }
    define_method("#{attribute}=".to_sym) do |value|
      raise TypeError, 'Value has invalid argument type' unless value.is_a?(class_name)

      instance_variable_set(attribute_var, value)
    end
  end
end

# encoding: utf-8
class Object #:nodoc:
  # Set instance variables by key and value only if object respond
  # to access method for variable.
  def instance_variables_set_from(hash)
    hash.collect do |variable, value|
      instance_variable_set("@#{variable}", value) if respond_to? variable
    end
    self
  end
end

class Symbol #:nodoc:
  # Method for comparison between symbols.
  def <=>(other)
    to_s <=> other.to_s
  end

  # Parse the symbol name to constant name. Example:
  #
  #   $ :http_backend.to_const_name
  #   => 'HttpBackend'
  def to_const_name
    n = to_s.split(/_/).map(&:capitalize).join
    RUBY_VERSION =~ /1\.8/ ? n : n.to_sym
  end
end

class Hash #:nodoc:
  # Only symbolize all keys, including all key in sub-hashes.
  def symbolize_keys
    return clone if empty?
    each_with_object({}) do |(key, value), hash|
      hash[key.to_sym] = (value.is_a? Hash) ? value.symbolize_keys : value
      hash
    end
  end

  # Convert to Struct including all values that are Hash class.
  def to_struct
    attributes = keys.sort
    members    = attributes.map(&:to_sym)
    Struct.new(*members).new(*attributes.map do |key|
      attribute = fetch key
      (attribute.is_a? Hash) ? attribute.to_struct : attribute
    end) unless empty?
  end
end

class String #:nodoc:
  def to_semver_h
    tags   = [:major, :minor, :patch, :status]
    values = split('.').map do |key|
      # Check pre-release status
      if key =~ /^(?<minor>\d{1,})(?<status>[a-z]+[\d\w]{1,}.*)$/i
        [minor.to_i, status]
      else
        key.to_i
      end
    end.flatten
    Hash[tags.zip(values)]
  end

  def to_attr_name
    split('::').last.gsub(/(?<obj>.)(?<action>[A-Z])/) do
      [obj, access.downcase].join('_')
    end.downcase
  end
end

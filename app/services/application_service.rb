module ApplicationService
  attr_reader :result

  class NotImplementedError < ::StandardError; end

  module ClassMethods
    def call(*args)
      new(*args).call
    end
  end

  def self.prepended(base)
    base.extend ClassMethods
  end

  def call
    raise NotImplementedError unless defined?(super)

    @called = true
    @result = super

    self
  end

  def errors
    @errors ||= []
  end

  def success?
    called? && !failure?
  end

  def failure?
    called? && errors.any?
  end

  def called?
    @called ||= false
  end
end

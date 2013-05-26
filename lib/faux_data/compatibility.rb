class Array  #:nodoc:
  unless [].respond_to?(:choice)
    alias_method :choice, :sample if [].respond_to?(:sample) # 1.8.7 support
  end
end

require 'forwardable'

module Tipo
  class Font
    extend Forwardable
    
    def_delegators :@file, :seek, :tell

    def initialize file
      @file = File.open file, 'rb:ASCII-8BIT'
    end

    def encoding
      @file.read(5).encoding
    end

    def chunk options
      @file.seek options[:seek] if options[:seek]
      @file.read options.fetch :bytes
    end

    def unpack options
      tmpl = options.delete :tmpl
      chunk(options).unpack tmpl
    end
  end
end


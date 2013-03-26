require "active_support/inflector"

require "tipo/version"
require "tipo/table"
require "tipo/header"
require "tipo/font"
require "tipo/table"

module Tipo
  class Info
    attr_reader :font, :header

    def initialize file
      @font = Font.new file
      @header = Header.new font
    end

    def method_missing table, *args, &block
      table = "tipo/table/#{table}".camelize.constantize
      table.new @header, @font
    end
  end

  def self.info file 
    Info.new file
  end
end

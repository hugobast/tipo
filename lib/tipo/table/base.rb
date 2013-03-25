module Tipo
  module Table
    class Base 
      attr_reader :font_header, :font
      attr_accessor :name

      def initialize font_header, font
        @font_header = font_header
        @font = font
      end

      def offset 
        seek_to_table @name 
      end

      private

      def seek_to_table tag
        font.seek find_table(tag).offset
        font.tell
      end

      def find_table tag
        font_header.table_records.select { |t| t.tag == tag }.first
      end
    end
  end
end

module Tipo
  module Table
    class Naming < Base 
      # full template 'n3'
      Header = Struct.new :format, :count, :storage_offset

      # full template 'n6'
      NameRecord = Struct.new(
        :platform, :encoding, :language, :name, :length, :offset)

      def initialize header, font
        @name = 'name'
        super
      end

      def header
        Header.new *(font.unpack seek: offset, bytes: 6, tmpl: 'n3')
      end

      def storage_offset
        header.storage_offset + offset
      end

      def naming_list 
        header.count.times.map do
          NameRecord.new *(font.unpack bytes: 12, tmpl: 'n6')
        end
      end

      def record_at id
        naming_list.select do |n|
          n.name == id && n.platform == 1
        end.first
      end

      def family_name
        stringify_record record_at 1
      end

      def name
        stringify_record record_at 4
      end

      def style
        stringify_record record_at 2
      end

      private

      def stringify_record record
        # To handle both 16bit and 8bit strings 
        # first convert to a ord array and build the string
        #
        # TODO: Verify platform and encoding ids and provide 
        # the proper template for each
        #
        text = font.unpack(
          seek: storage_offset + record.offset,
          bytes: record.length,
          tmpl: 'c*')
        text.pack 'U*'
      end
    end
  end
end

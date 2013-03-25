module Tipo
  module Table
    class Substitution < Base
      # full template 'n5'
      Header = Struct.new(
        :version_left, :version_right, 
        :script_offset, :feature_offset, :lookup_offset) do
        def version
          "#{version_left}.#{version_right}"
        end
      end

      # full template 'a4n'
      FeatureRecord = Struct.new :tag, :feature_offset

      def initialize header, font
        @name = "GSUB"
        super
      end
      
      def header
        Header.new *(font.unpack seek: offset, bytes: 10, tmpl: 'n5')
      end

      def feature_list_offset
        header.feature_offset + offset
      end

      def feature_list_count
        font.unpack(seek: feature_list_offset, bytes: 2, tmpl: 'n').first 
      end

      def feature_list
        feature_list_count.times.map do
          FeatureRecord.new *(font.unpack bytes: 6, tmpl: 'a4n')
        end
      end
    end
  end
end

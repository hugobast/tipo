module Tipo
  class Header
    # full template 'a4n4'
    OffsetTable = Struct.new :version, :tables_count

    # full template 'a4N3'
    TableRecord = Struct.new :tag, :checksum, :offset

    attr_reader :font
    
    def initialize font 
      @font = font 
    end

    def offset_table
      OffsetTable.new *(font.unpack seek: 0, bytes: 12, tmpl: 'a4n')
    end

    def table_records
      font.seek 13 
      offset_table.tables_count.times.map do
        TableRecord.new *(font.unpack bytes: 16, tmpl: 'a4N2')
      end
    end
  end
end

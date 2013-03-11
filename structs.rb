module Structs
  OffsetTable = Struct.new(
    :version, :tables_count, :search_range, :entry_selector, :range_shift
  )

  TableRecord = Struct.new(
    :tag, :checksum, :offset, :length
  )
end

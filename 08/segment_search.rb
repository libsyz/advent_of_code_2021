

def segment_search(entries, easy_mode:)
#segments
      #number
  easy_numbers = {2 => 1,
   4 => 4,
   3 => 7,
   7 => 8 }


  easy_number_count = 0

  entries.each do |entry|
    entry[:entry][:outputs].each do |sp|
      easy_numbers[sp.length] ? easy_number_count += 1 : nil
    end
  end
  return easy_number_count
end

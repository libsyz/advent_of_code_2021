require 'pry-byebug'

# REF = {
#   'CH' => 'B',
#   'HH' => 'N',
#   'CB' => 'H',
#   'NH' => 'C',
#   'HB' => 'C',
#   'HC' => 'B',
#   'HN' => 'C',
#   'NN' => 'C',
#   'BH' => 'H',
#   'NC' => 'B',
#   'NB' => 'B',
#   'BN' => 'B',
#   'BB' => 'N',
#   'BC' => 'B',
#   'CC' => 'N',
#   'CN' => 'C'
# }

REF = {
  'HH' => 'K',
  'PS' => 'P',
  'BV' => 'H',
  'HB' => 'H',
  'CK' => 'F',
  'FN' => 'B',
  'PV' => 'S',
  'KK' => 'F',
  'OF' => 'C',
  'SF' => 'B',
  'KB' => 'S',
  'HO' => 'O',
  'NH' => 'N',
  'ON' => 'V',
  'VF' => 'K',
  'VP' => 'K',
  'PH' => 'K',
  'FF' => 'V',
  'OV' => 'N',
  'BO' => 'K',
  'PO' => 'S',
  'CH' => 'N',
  'FO' => 'V',
  'FB' => 'H',
  'FV' => 'N',
  'FK' => 'S',
  'VC' => 'V',
  'CP' => 'K',
  'CO' => 'K',
  'SV' => 'N',
  'PP' => 'B',
  'BS' => 'P',
  'VS' => 'C',
  'HV' => 'H',
  'NN' => 'F',
  'NK' => 'C',
  'PC' => 'V',
  'HS' => 'S',
  'FS' => 'S',
  'OB' => 'S',
  'VV' => 'N',
  'VO' => 'P',
  'KV' => 'F',
  'SK' => 'O',
  'BC' => 'P',
  'BP' => 'F',
  'NS' => 'P',
  'SN' => 'S',
  'NC' => 'N',
  'FC' => 'V',
  'CN' => 'S',
  'OK' => 'B',
  'SC' => 'N',
  'HN' => 'B',
  'HP' => 'B',
  'KP' => 'B',
  'CB' => 'K',
  'KF' => 'C',
  'OS' => 'B',
  'BH' => 'O',
  'PN' => 'K',
  'VN' => 'O',
  'KH' => 'F',
  'BF' => 'H',
  'HF' => 'K',
  'HC' => 'P',
  'NP' => 'H',
  'KO' => 'K',
  'CF' => 'H',
  'BK' => 'O',
  'OH' => 'P',
  'SO' => 'F',
  'BB' => 'F',
  'VB' => 'K',
  'SP' => 'O',
  'SH' => 'O',
  'PK' => 'O',
  'HK' => 'P',
  'CC' => 'V',
  'NB' => 'O',
  'NV' => 'F',
  'OO' => 'F',
  'VK' => 'V',
  'FH' => 'H',
  'SS' => 'C',
  'NO' => 'P',
  'CS' => 'H',
  'BN' => 'V',
  'FP' => 'N',
  'OP' => 'N',
  'PB' => 'P',
  'OC' => 'O',
  'SB' => 'V',
  'VH' => 'O',
  'KS' => 'B',
  'PF' => 'N',
  'KN' => 'H',
  'NF' => 'N',
  'CV' => 'K',
  'KC' => 'B',
}

# def polymerize!(string, steps: 1)

#   steps.times do |step|
#    string = string.split('').each_cons(2).map.with_index do |pair, index|
#       new_element = KEY[pair.join]
#       index.zero? ? "#{pair.first}#{new_element}#{pair.last}" : "#{new_element}#{pair.last}"
#     end.join
#   end
#   return string
# end

# puts polymerize!('SHHNCOPHONHFBVNKCFFC', steps: 40)

def polymerize!(string, steps: 1)
  start_state = string.split('').each_cons(2).map(&:join)
  letters_hash = Hash.new(0)
  state_hash = Hash.new(0)

  REF.keys.each do |key|
    state_hash[key] = 0
  end


  start_state.each do |pair|
    state_hash[pair] += 1
  end

  letters_hash.merge!(string.split('').tally)
  steps.times do |step|
    step_state = Hash.new(0)
    state_hash.keys.select { |key| state_hash[key] > 0}.each do |key|

        new_letter = REF[key]
        new_key_behind = key[0] + new_letter
        new_key_after = new_letter + key[1]

        increase = state_hash[key]
        letters_hash[new_letter] += increase
        step_state[new_key_behind] += increase
        step_state[new  ∑œœ_key_after] += increase
        step_state[key] -= increase
    end
    step_state.keys.each do |key|
      state_hash[key] += step_state[key]
    end
  end

  letters_hash
end


puts polymerize!('SHHNCOPHONHFBVNKCFFC', steps: 40)
binding.pry

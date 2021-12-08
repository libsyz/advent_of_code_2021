require 'rspec'
require 'pry-byebug'
require_relative '../segment_search.rb'
    ENTRIES = [
      {
        entry: {
          signal_patterns: ['be','cfbegad','cbdgef','fgaecd','cgeb','fdcge','agebfd','fecdb','fabcd','edb'],
          outputs: ['fdgacbe', 'cefdb', 'cefbgd', 'gcbe'] }
      },
      {
        entry: {
          signal_patterns: ['edbfga', 'begcd', 'cbg', 'gc', 'gcadebf' ,'fbgde', 'acbgfd', 'abcde', 'gfcbed', 'gfec'],
          outputs: ['fcgedb', 'cgb', 'dgebacf', 'gc']
        }
      },
      {
        entry: {
          signal_patterns: ['fgaebd', 'cg', 'bdaec', 'gdafb', 'agbcfd' ,'gdcbef', 'bgcad', 'gfac', 'gcb', 'cdgabef'] ,
          outputs: ['cg', 'cg', 'fdcagb', 'cbg']
        }
      },
      {
        entry: {
          signal_patterns: ['fbegcd', 'cbd', 'adcefb', 'dageb', 'afcb' ,'bc', 'aefdc', 'ecdab', 'fgdeca', 'fcdbega'] ,
          outputs: ['efabcd', 'cedba', 'gadfec', 'cb']
        }
      },
      {
        entry: {
          signal_patterns: ['aecbfdg', 'fbg', 'gf', 'bafeg', 'dbefa' ,'fcge', 'gcbea', 'fcaegb', 'dgceab', 'fcbdga'],
          outputs: ['gecf', 'egdcabf', 'bgf', 'bfgea']
        }
      },
      {
        entry: {
          signal_patterns: ['fgeab', 'ca', 'afcebg', 'bdacfeg', 'cfaedg' ,'gcfdb', 'baec', 'bfadeg', 'bafgc', 'acf'],
          outputs: ['gebdcfa', 'ecba', 'ca', 'fadegcb']
        }
      },
      {
        entry: {
          signal_patterns: ['dbcfg', 'fgd', 'bdegcaf', 'fgec', 'aegbdf' ,'ecdfab', 'fbedc', 'dacgb', 'gdcebf', 'gf'],
          outputs: ['cefg', 'dcbef', 'fcge', 'gbcadfe']
        }
      },
      {
        entry: {
          signal_patterns: ['bdfegc', 'cbegaf', 'gecbf', 'dfcage', 'bdacg' ,'ed', 'bedf', 'ced', 'adcbefg', 'gebcd'] ,
          outputs: ['ed', 'bcgafe', 'cdgba', 'cbgef']
        }
      },
      {
        entry: {
          signal_patterns: ['egadfb', 'cdbfeg', 'cegd', 'fecab', 'cgb' ,'gbdefca', 'cg', 'fgcdab', 'egfdb', 'bfceg'] ,
          outputs: ['gbdfcae', 'bgc', 'cg', 'cgb']
        }
      },
      {
        entry: {
          signal_patterns: ['gcafb', 'gcf', 'dcaebfg', 'ecagb', 'gf' ,'abcdeg', 'gaef', 'cafbge', 'fdbac', 'fegbdc'],
          outputs: ['fgae', 'cfgab', 'fg', 'bagce']
        }
      }
    ]

describe "#segment_search" do
  context "part 1 - counting how many times 1, 4, 7 and 8 appear" do



    it "returns the right number of easy numbers" do
      res = easy_segment_search(ENTRIES)
      expect(res).to eq(26)
    end
  end

  context "part 2 - figure out the positions of the segment reader" do
    it 'calculates the right numbers per entry' do
      res = hard_segment_search(ENTRIES)
      solution = [8394, 9781, 1197, 9361, 4873, 8418, 4548, 1625, 8717, 4315 ]
      expect(res).to eq(solution)
      expect(res.sum).to eq(61229)
    end
#   0:      1:      2:      3:      4:
#  aaaa    ....    aaaa    aaaa    ....
# b    c  .    c  .    c  .    c  b    c
# b    c  .    c  .    c  .    c  b    c
#  ....    ....    dddd    dddd    dddd
# e    f  .    f  e    .  .    f  .    f
# e    f  .    f  e    .  .    f  .    f
#  gggg    ....    gggg    gggg    ....

#   5:      6:      7:      8:      9:
#  aaaa    aaaa    aaaa    aaaa    aaaa
# b    .  b    .  .    c  b    c  b    c
# b    .  b    .  .    c  b    c  b    c
#  dddd    dddd    ....    dddd    dddd
# .    f  e    f  .    f  e    f  .    f
# .    f  e    f  .    f  e    f  .    f
#  gggg    gggg    ....    gggg    gggg
  end
end


describe "#decode" do
  input =
        {
          entry: {
            signal_patterns: [ 'acedgfb','cdfbe','gcdfa','fbcad','dab','cefabd','cdfgeb','eafb','cagedb','ab'] ,
            outputs: ['cdfeb', 'fcadb', 'cdfeb', 'cdbaf']
          }
        }

    it 'correctly decodes number 0' do
      res = decode(input)
      expect(res[0]).to eq('cagedb')
    end

    it 'correctly decodes number 1' do
      res = decode(input)
      expect(res[1]).to eq('ab')
    end

    it 'correctly decodes number 2' do
      res = decode(input)
      expect(res[2]).to eq('gcdfa')
    end

    it 'correctly decodes number 3' do
      res = decode(input)
      expect(res[3]).to eq('fbcad')
    end

    it 'correctly decodes number 4' do
      res = decode(input)
      expect(res[4]).to eq('eafb')
    end

    it 'correctly decodes number 5' do
      res = decode(input)
      expect(res[5]).to eq('cdfbe')
    end

    it 'correctly decodes number 6' do
      res = decode(input)
      expect(res[6]).to eq('cdfgeb')
    end

    it 'correctly decodes number 7' do
      res = decode(input)
      expect(res[7]).to eq('dab')
    end

    it 'correctly decodes number 8' do
      res = decode(input)
      expect(res[8]).to eq('acedgfb')
    end

    it 'correctly decodes number 9' do
      res = decode(input)
      expect(res[9]).to eq('cefabd')
    end


  end

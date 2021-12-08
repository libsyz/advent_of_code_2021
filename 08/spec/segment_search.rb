require 'rspec'
require_relative '../segment_search.rb'

describe "#segment_search" do
  context "part 1 - counting how many times 1, 4, 7 and 8 appear" do
    entries = [
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

    segment_search()
  end


end

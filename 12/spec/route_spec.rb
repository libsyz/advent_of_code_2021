
require_relative '../route.rb'
require 'rspec'


describe '#get_routes' do
  context 'with first set of nodes' do
    it 'returns 10 possible routes that lead to the end' do
      list = ["start-A",
              "start-b",
              "A-c",
              "A-b",
              "b-d",
              "A-end",
              "b-end"]

    node_list = NodeParser.new.generate(list).nodes
    start_node = node_list.find { |nd| nd.name == 'start' }

    all_routes = get_routes(start_node, [])
    end_routes = all_routes.select { |route| route[1].include?('end') }
    expect(end_routes.length).to eq 10
    end
  end

  context 'with second set of nodes' do
    it 'returns 19 possible routes that lead to the end' do
      list = ['dc-end',
              'HN-start',
              'start-kj',
              'dc-start',
              'dc-HN',
              'LN-dc',
              'HN-end',
              'kj-sa',
              'kj-HN',
              'kj-dc']

      node_list = NodeParser.new.generate(list).nodes
      start_node = node_list.find { |nd| nd.name == 'start' }

      all_routes = get_routes(start_node, [])
      end_routes = all_routes.select { |route| route[1].include?('end') }
      expect(end_routes.length).to eq 19
    end
  end

  context 'with third set of nodes' do
    it 'returns 226 possible routes that lead to the end' do
      list = ['fs-end',
              'he-DX',
              'fs-he',
              'start-DX',
              'pj-DX',
              'end-zg',
              'zg-sl',
              'zg-pj',
              'pj-he',
              'RW-he',
              'fs-DX',
              'pj-RW',
              'zg-RW',
              'start-pj',
              'he-WI',
              'zg-he',
              'pj-fs',
              'start-RW']

      node_list = NodeParser.new.generate(list).nodes
      start_node = node_list.find { |nd| nd.name == 'start' }

      all_routes = get_routes(start_node, [])
      end_routes = all_routes.select { |route| route[1].include?('end') }
      expect(end_routes.length).to eq 226
    end
  end


end

describe '#get_long_routes' do
  context 'with first set of nodes' do
    it 'returns 36 possible routes that lead to the end' do
      list = ["start-A",
              "start-b",
              "A-c",
              "A-b",
              "b-d",
              "A-end",
              "b-end"]

    node_list = NodeParser.new.generate(list).nodes
    start_node = node_list.find { |nd| nd.name == 'start' }

    all_routes = get_long_routes(start_node, [])
    end_routes = all_routes.select { |route| route[1].include?('end') }

    expect(end_routes.length).to eq 36
    end
  end

  context 'with second set of nodes' do
    it 'returns 103 possible routes that lead to the end' do
      list = ['dc-end',
              'HN-start',
              'start-kj',
              'dc-start',
              'dc-HN',
              'LN-dc',
              'HN-end',
              'kj-sa',
              'kj-HN',
              'kj-dc']

      node_list = NodeParser.new.generate(list).nodes
      start_node = node_list.find { |nd| nd.name == 'start' }

      all_routes = get_long_routes(start_node, [])
      end_routes = all_routes.select { |route| route[1].include?('end') }
      expect(end_routes.length).to eq 103
    end
  end

  context 'with third set of nodes' do
    it 'returns 3509 possible routes that lead to the end' do
      list = ['fs-end',
              'he-DX',
              'fs-he',
              'start-DX',
              'pj-DX',
              'end-zg',
              'zg-sl',
              'zg-pj',
              'pj-he',
              'RW-he',
              'fs-DX',
              'pj-RW',
              'zg-RW',
              'start-pj',
              'he-WI',
              'zg-he',
              'pj-fs',
              'start-RW']

      node_list = NodeParser.new.generate(list).nodes
      start_node = node_list.find { |nd| nd.name == 'start' }

      all_routes = get_long_routes(start_node, [])
      end_routes = all_routes.select { |route| route[1].include?('end') }
      expect(end_routes.length).to eq 3509
    end
  end


end

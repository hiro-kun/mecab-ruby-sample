require 'natto'

text = '形態素解析したい文章をここに記載します。'
nm = Natto::MeCab.new

tmp_map = {}

nm.parse(text) do |n|
  tmp_map[n.surface] = tmp_map[n.surface] ? tmp_map[n.surface] + 1 : 1
  #puts "#{n.surface},#{n.feature}\n"
end

tmp_map = tmp_map.sort_by { |_k, v| v }

tmp_map = Hash[tmp_map.sort_by { |_, v| -v }]

tmp_map.each do |word, count|
  puts "#{word},#{count}\n"
end
require 'json'

hash = nil
File.open('tmp/asrOutput.json') { |body| hash = JSON.load(body) }

ITEMS = hash['results']['items']

def most_confidence_content(alternatives)
  alternatives.sort { |a, b| b['confidence'].to_f <=> a['confidence'].to_f }.first['content']
end

def search_content(item)
  ITEMS.each do |i|
    if item['start_time'] == i['start_time'] && item['end_time'] == i['end_time']
      return most_confidence_content(i['alternatives'])
    end
  end
  nil
end

talks = []
hash['results']['speaker_labels']['segments'].each do |segment|
  content = segment['items'].map do |item|
    search_content(item)
  end.join
  talks << {
    speaker: segment['speaker_label'],
    content: content
  }
end

talks.each do |talk|
  puts "#{talk[:speaker]}:#{talk[:content]}"
end

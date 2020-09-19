persons = {
  'spk_0' => ':@first_person:',
  'spk_1' => ':@second_person:',
  'spk_2' => ':@third_person:',
}

File.open('tmp/output.txt') do |f|
  f.each_line do |line|
    person, content = line.split(':')
    puts "#{persons[person]} #{content}"
  end
end

require 'csv'
CSV.open('data.csv').each do |row|
  name = row[1]
  s = Speaker.where(:name => name).first
  s.short_bio = row[18] if s
  s.save if s
end
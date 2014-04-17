namespace :match do
  task :parse => :environment do
    file = ENV.fetch('filename')
    puts "Parsing #{file}..."

    # Upload match file
    match = Match.create!
    dest_filename = "#{match.id}.txt"
    system "cp #{file} #{File.join Rails.root, 'public', 'matches', dest_filename}" or raise "cp failed!"
    match.update_attributes! path: "/matches/#{dest_filename}"

    teams = {}

    # Parse teams scores
    File.read(file).scan(/TEAM (\w+) = (.+)/) do |m|
      name, score = m.to_a
      score = score.to_f
      teams[name] ||= []
      teams[name] << score
    end

    teams.each do |name, scores|
      puts "#{name}, #{scores.inspect}"
      team = Team.find_or_initialize_by_name(name)
      average = scores.sum.to_f / scores.count.to_f
      team.scores[match.id] = average
      team.save!
    end
  end
end

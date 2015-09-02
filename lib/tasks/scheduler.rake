desc "Deliver cat wisdom to the world!!!"
task :daily_wisdom => :environment do
  puts "Sending wisdom..."
  DailyWisdomJob.perform_later
  puts "done."
end

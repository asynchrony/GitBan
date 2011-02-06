configuration = ENV['CONFIGURATION'] || 'Debug'

task :default => :build

Dir['lib/task/*.rake'].each do |rake|
  import rake
end

task :test do
  sh 'cd ./shtests/ && ./run-test-suite'
end

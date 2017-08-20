task :default do
    FileList["./test/node_test.rb"].each { |file| ruby file }
end

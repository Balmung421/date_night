task :default do
    FileList["./test/node_test.rb", "./test/load_test.rb", "./test/sort_test.rb"].each { |file| ruby file }
end

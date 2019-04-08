namespace :export do
  desc 'Export books to algolia service'
  task :books do
    ExportInteractor.new.call
  end
end

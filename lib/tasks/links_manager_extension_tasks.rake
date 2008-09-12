namespace :radiant do
  namespace :extensions do
    namespace :links_manager do
      
      desc "Runs the migration of the Links Manager extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          LinksManagerExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          LinksManagerExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Links Manager to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[LinksManagerExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(LinksManagerExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end

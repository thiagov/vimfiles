# This script finds the .classpath file from an Eclipse project and
# outputs all its dependencies. The script can be called from
# any folder within the project root folder. It considers
# the workspace directory to be the project's parent directory.
require 'nokogiri'
require 'pp'

def print_project_classpath(project_dir, included = {})
  begin
    workspace_dir = File.expand_path("..", project_dir)
    #####
    # Necessary when versioning according to egit!
    while (!File.directory?("#{workspace_dir}/.metadata"))
      workspace_dir = File.expand_path("..", workspace_dir)
    end
    if (!File.file?("#{project_dir}/.classpath"))
      name = project_dir.split("/").last
      project_dir = "#{project_dir}/#{name}"
    end
    #####
    classpath = File.open("#{project_dir}/.classpath")
    doc = Nokogiri::XML(classpath)

    if !included[project_dir]
      # Sources (patas src, projetos incluídos, etc.)
      teste = doc.xpath('//classpath/classpathentry[@kind = "src"]').each do |x|
        str = x['path']
        if str.match(/^\//)
          print_project_classpath("#{workspace_dir}#{x['path']}", included)
        else
          puts "#{project_dir}/#{x['path']}"
        end
      end

      # Bibliotecas
      teste = doc.xpath('//classpath/classpathentry[@kind = "lib"]').each do |x|
        if "#{workspace_dir}".scan(/\/$/i).empty? && "#{x['path']}".scan(/^\//i).empty?
          puts "#{project_dir}/#{x['path']}"
        else
          puts "#{workspace_dir}#{x['path']}"
        end
      end

      included[project_dir] = true
    end
  rescue
    puts ""
  end
end

current_dir = Dir.pwd
#####
# Necessary when versioning according to egit!
# proj_name
#  \
#   .git
#   proj_name
if (!File.file?("#{current_dir}/.classpath"))
  name = current_dir.split("/").last
  if Dir.entries(current_dir).include?(name)
    current_dir = "#{current_dir}/#{name}"
  end
end
if current_dir == "/home/thiagov/Workspaces/mars-bhiss-workspace/bhiss-cert-digital"
  current_dir = "#{current_dir}/bhiss-cert-digital"
end
#####

next_dir    = File.expand_path("..", current_dir)
while (!File.file?("#{current_dir}/.classpath") && next_dir != current_dir)
  current_dir = next_dir
  next_dir    = File.expand_path("..", current_dir)
end

print_project_classpath(current_dir)

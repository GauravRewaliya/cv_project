module CvHelper

    def helper_grouped_projects_options()
      grouped_options = []

      TechStack.core_skills.each do |core_skill|
        projects = core_skill.projects
        options = projects.map { |project| [project.title, project.id] }
        grouped_options << [core_skill.title, options] unless options.empty?
      end
  
      grouped_options
    end
  end
  
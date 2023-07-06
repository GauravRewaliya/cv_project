module ApplicationHelper
    def display_tech_type(tech_type)
        if(tech_type == 1)
            "core_skill"
        elsif(tech_type == 2)
             "supportive_skill"
        else
            "not defined"
        end 
    end
end

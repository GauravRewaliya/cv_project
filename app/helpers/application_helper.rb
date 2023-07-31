module ApplicationHelper
    def display_tech_type(tech_type)
        if(tech_type == 1)
            "Core skill"
        elsif(tech_type == 2)
             "Supportive skill"
        else
            "not defined"
        end 
    end
    def helper_custom_error(form, attribute)
        form.object.errors[attribute].map do |message|
            content_tag(:div, message, style: 'background: cornsilk; color: red; border-radius: 5px;')
          end.join.html_safe
    end
end

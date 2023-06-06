class TemplateFormat < ApplicationRecord
    # belongs_to :curriculum_vitae , optional: true
    
    #  ------can put has_many cv---------
    before_destroy :fix_destroy
    def fix_destroy
        CvTemplate.where(template_format_id: self.id).destroy_all
    end
end

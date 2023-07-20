                /// req select_picker
      function supportive_skills_fix()
      {
      $('input[name*="proj_supportive_skill_ids"]').remove();
      }

      function deleteRepeaterItem(button) {
        var item = $(button).closest('[data-repeater-item]');
        var destroyField = item.find('.destroy-field');
        destroyField.val('true'); 
        var i = item.index();
        if($('#curriculum_vitae_company_experiences_attributes_'+i+'_id')[0] != undefined)
          item[0].hidden = true;
        else
          item.remove();
        }
     
        function showHide(curr_obj) {
          d = curr_obj.closest("[data-repeater-item]");
          if(d.children[1].hidden == true)
          {
            $(curr_obj).removeClass("fa-eye")
            $(curr_obj).addClass("fa-eye-slash")
            d.children[1].hidden = false;
          } else
          {
            $(curr_obj).removeClass("fa-eye-slash")
            $(curr_obj).addClass("fa-eye")
            d.children[1].hidden =true;
          }
          select_picker_refresh();
        }
      
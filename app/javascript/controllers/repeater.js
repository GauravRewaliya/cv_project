                /// req select_picker
                //ckeditor
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
      function repeater_refresh() {
        setSelectOptions();
        select_picker_refresh();
        setTimeout(() =>{
          ckeditor_load();
        }, "100");
      }
      function setSelectOptions()
      {
        // storedcoreSkills ,storedsupportiveSkills ,storedDomains 
        var lastChild =$('.repeater_proj .rep').children().last();
        var coreSkillSelector = lastChild.find('.core_skill_selector');
        var supportiveSkillSelector = lastChild.find('.supportive_skill_selector');
        var domainSelector = lastChild.find('.domain_selector');
        debugger
        for (var i = 0; i < storedcoreSkills.length; i++) {
          coreSkillSelector.append(storedcoreSkills[i]);
        }
        for (var i = 0; i < storedsupportiveSkills.length; i++) {
          supportiveSkillSelector.append(storedsupportiveSkills[i]);
        }
        for (var i = 0; i < storedDomains.length; i++) {
          domainSelector.append(storedDomains[i]);
        }
        
      }
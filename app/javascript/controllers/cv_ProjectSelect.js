function project_select(curr_obj) { 
    var projId = $(curr_obj).val();
    obj_content = curr_obj.closest("[data-repeater-item]").children[1];
    $.ajax({
    url: '/projects/'+projId+'/cv_project_details.json',
    method: 'GET',
    dataType: 'json',
    success: function(response){
        // $(obj_content).find("[name*='end_date']").val(response.project.end_date); 
        for( prop in response.project)
        {
        if( $(obj_content).find("[name*='["+prop+"]']").length > 0  )
            $(obj_content).find("[name*='["+prop+"]']").val(response.project[prop]);
        }
        $(obj_content).find("[name*='[proj_core_skill_id]']").val(response.core_skill_id);
        $(obj_content).find("[name*='[domain_id]']").val(response.domain_id);
        $(obj_content).find("[name*='[proj_supportive_skill_ids]']").val(response.supportive_skill_ids);
        select_picker_refresh();
    }
    })
}
      
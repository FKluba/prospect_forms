#Result expected, params correct
#{"name"=>"freg", "description"=>"ergqerg", "tasks_attributes"=>{"1412667115075"=>{"description"=>"test1", "done"=>"1", "_destroy"=>""}, "1412667122862"=>{"description"=>"test2", "done"=>"0", "_destroy"=>""}}}
#{"name"=>"defze", "description"=>"grgre", "tasks_attributes"=>{"0"=>{"description"=>"task1", "done"=>"0", "_destroy"=>"1", "id"=>"2"}, "1"=>{"description"=>"task2", "done"=>"0", "_destroy"=>"", "id"=>"3"}}}


#Actual result, not correct
#{"name"=>"rrr", "description"=>"rrezrez", "questions_attributes"=>{"0"=>{"question"=>"fqsdfdsq"}}}

#New result, correct one
#{"name"=>"", "description"=>"", "questions_attributes"=>{"0"=>{"question"=>"test"}, "1412772466476"=>{"question"=>"test"}, "1412772475993"=>{"question"=>"test"}, "1412772482409"=>{"question"=>"test"}}}


jQuery ->
  jQuery("#add_question").click ->
    new_nested_fields_container = jQuery(".nested-fields").clone().first()

    new_nested_fields = jQuery(new_nested_fields_container).find('input, select, textarea')
    new_nested_fields_fingerprint = Date.now()
    name_attr_regexp = /(^.*\[.*_attributes\]\[)(.*)(\]\[.*\]$)/


    jQuery(new_nested_fields).each ->
      name_attr = jQuery(this).attr('name')

      # Find and remove id field
      id_regexp = /\[id\]$/
      is_and_id_field = id_regexp.exec(name_attr)

      if is_and_id_field != null
        jQuery(this).remove()
      else
        regexp_results = name_attr_regexp.exec(name_attr)
        new_name_attr = regexp_results[1] + new_nested_fields_fingerprint + regexp_results[3]
        jQuery(this).attr("name", new_name_attr)


    jQuery(new_nested_fields_container).find("input:text").val("")
    jQuery(new_nested_fields_container).appendTo("#questions")
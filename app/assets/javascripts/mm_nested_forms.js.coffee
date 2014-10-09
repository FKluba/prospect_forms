#Result expected, params correct
#{"name"=>"freg", "description"=>"ergqerg", "tasks_attributes"=>{"1412667115075"=>{"description"=>"test1", "done"=>"1", "_destroy"=>""}, "1412667122862"=>{"description"=>"test2", "done"=>"0", "_destroy"=>""}}}
#{"name"=>"defze", "description"=>"grgre", "tasks_attributes"=>{"0"=>{"description"=>"task1", "done"=>"0", "_destroy"=>"1", "id"=>"2"}, "1"=>{"description"=>"task2", "done"=>"0", "_destroy"=>"", "id"=>"3"}}}


#Actual result, not correct
#{"name"=>"rrr", "description"=>"rrezrez", "questions_attributes"=>{"0"=>{"question"=>"fqsdfdsq"}}}

#New result, correct one
#{"name"=>"", "description"=>"", "questions_attributes"=>{"0"=>{"question"=>"test"}, "1412772466476"=>{"question"=>"test"}, "1412772475993"=>{"question"=>"test"}, "1412772482409"=>{"question"=>"test"}}}


@load_remove_sub_form_buttons = ->
  jQuery(".sub-form-remove").click ->
    nested_fields_container = jQuery(this).parent()
    nested_fields_attr_wrapper = jQuery(nested_fields_container).attr("data-name-attr-wrapper")
    if nested_fields_attr_wrapper
      if !jQuery(nested_fields_container).hasClass("new-subform-nested-fields")
        destroy_attr_name = nested_fields_attr_wrapper + "[_destroy]"
        jQuery(nested_fields_container).append('<input type="hidden" name="'+ destroy_attr_name + '" value = "1"/>')
        jQuery(nested_fields_container).hide()
      else
        jQuery(nested_fields_container).remove()




@get_nested_fields_attr_wrapper = (nested_fields_container, input, fingerprint) ->
  name_attr_wrapper = ""
  if typeof(input) == "undefined"
    input = jQuery(nested_fields_container).find('input, select, textarea').first()

  if input and input.length > 0
    name_attr_regexp = /(^.*\[.*_attributes\]\[)(.*)(\]\[.*\]$)/
    name_attr_wrapper = ""
    name_attr = jQuery(input).attr('name')
    regexp_results = name_attr_regexp.exec(name_attr)
    if typeof(fingerprint) != "undefined"
      name_attr_wrapper = regexp_results[1] + fingerprint + regexp_results[3]
      jQuery(nested_fields_container).attr("data-name-attr-wrapper", regexp_results[1] + fingerprint + "]")
    else
      name_attr_wrapper = regexp_results[1] + regexp_results[2]
      name_attr_wrapper += "]"
      jQuery(nested_fields_container).attr("data-name-attr-wrapper", name_attr_wrapper)

  name_attr_wrapper

jQuery ->
  jQuery(".sub-form").each ->
    jQuery(this).find(".nested-fields").each ->
      get_nested_fields_attr_wrapper(jQuery(this))


  jQuery(".sub-form-add").click ->


    new_nested_fields_container = jQuery(this).parent().find(".nested-fields").first().clone()

    new_nested_fields = jQuery(new_nested_fields_container).find('input, select, textarea')
    new_nested_fields_fingerprint = Date.now()


    jQuery(new_nested_fields).each ->

      name_attr = jQuery(this).attr('name')

      # Find and remove id field
      id_regexp = /\[id\]$/
      is_and_id_field = id_regexp.exec(name_attr)

      if is_and_id_field != null
        jQuery(this).remove()
      else

        new_name_attr = get_nested_fields_attr_wrapper(new_nested_fields_container, jQuery(this), new_nested_fields_fingerprint)
        jQuery(this).attr("name", new_name_attr)





    jQuery(new_nested_fields_container).addClass("new-subform-nested-fields")
    jQuery(new_nested_fields_container).find("input:text").val("")
    jQuery(new_nested_fields_container).appendTo("#questions")
    load_remove_sub_form_buttons()


  load_remove_sub_form_buttons()

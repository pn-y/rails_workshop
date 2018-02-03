class StateEventInput < SimpleForm::Inputs::CollectionSelectInput
  def state_attribute_name
    attribute_name.to_s.gsub(/_event$/, '')
  end

  def collection
    object.send("#{state_attribute_name}_transitions")
  end

  def current_value
    object.send("human_#{state_attribute_name}_name")
  end

  def input(wrapper_options = nil)
    label_method = :human_event
    value_method = :event
    current_state = template.content_tag(:div, template.content_tag(:span, "Current state: #{current_value}", class: 'label label-info'))

    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

    out = @builder.collection_select(
      attribute_name, collection, value_method, label_method,
      input_options, merged_input_options
    )
    (out << current_state).html_safe
  end
end

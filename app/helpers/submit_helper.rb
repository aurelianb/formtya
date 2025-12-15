module SubmitHelper
  def form_item_field(form_item, form_builder)
    case form_item.item_type
    when "text"
      form_builder.text_field :value,
        placeholder: "Your Answer",
        class: input_classes,
          id: "submission_answers_attributes__item_#{form_item.id}"
    when "numeric"
      form_builder.number_field :value,
        placeholder: "Your Answer",
        class: input_classes,
        id: "submission_answers_attributes__item_#{form_item.id}"
    when "dropdown"
      form_builder.select :value,
        options_for_select(
          form_item.form_item_options.map { |i| [ i.label, i.value ] }
        ),
        { include_blank: "Please select" },
        { class: input_classes, id: "submission_answers_attributes__item_#{form_item.id}" }
    end
  end
end

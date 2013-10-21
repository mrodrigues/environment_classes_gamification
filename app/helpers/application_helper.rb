module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def table_for(data, options = {})
    content_tag :table do
      content_tag :tbody do
        data.map do |row|
          content_tag(:tr) do
            row.map { |cell| content_tag(:td, cell) }.join.html_safe
          end
        end.join.html_safe
      end
    end
  end

  def list_for(data)
    content_tag :ul do
      data.each do |item|
        concat(content_tag(:li, item))
      end
    end
  end

end

module ApplicationHelper
  def sortable(column, title)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

  def sortable_catalog(column, title, current_page)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, '/catalog/'+ my_gsub_in(current_page) +'?direction='+ direction +'&sort=' + column, {:class => css_class}
  end

  def list
    Product.select("DISTINCT(name)").order("name")
  end

  def my_gsub_in (string)
    string.gsub("/", "_").gsub("\\", "_").gsub("(", "-+").gsub(")", "+-")
  end

  def my_gsub_out (string)
    string.gsub("_", "/").gsub("-+", "(").gsub("+-", ")")
  end

end

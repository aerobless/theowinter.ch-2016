module HideSolutionFilter
  def hide(input)
     "<span class=\"solution\" style=\"color:white\" onmouseover=\"this.style.color='black';\" onmouseout=\"this.style.color='white';\">#{input}</span>"
  end
end

Liquid::Template.register_filter(HideSolutionFilter)

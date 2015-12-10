module HideSolutionFilter
  def hide(input)
    if input == "init"
     '<script>
      var solutionVisibility = false;
      var setVisible = function () {
        if(solutionVisibility){
          solutionVisibility = false;
          $( ".solution" ).css( "color", "white" );
          $(".solutionsButton").text("Show all solutions");
        } else {
          solutionVisibility = true;
          $( ".solution" ).css( "color", "black" );
          $(".solutionsButton").text("Hide all solutions");
        }
      };
      </script>'
    else
      "<span class=\"solution\" style=\"color:white\" onmouseover=\"this.style.color='black';\" onmouseout=\"this.style.color='white';\">#{input}</span>"
    end
  end
end
Liquid::Template.register_filter(HideSolutionFilter)

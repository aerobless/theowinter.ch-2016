module HideSolutionFilter
  def hide(input)
    #Script used to detect button presses & active/deactivate the solutions
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
    elsif input == "button"
      #Button that is shown to show/hide the solutions
      '<a class="btn-info solutionsButton" onclick="setVisible()" style="cursor: pointer;">Show all solutions</a>'
    else
      #span that hides the solutions by changing their color until a mouseover occurs
      "<span class=\"solution\" style=\"color:white\" onmouseover=\"this.style.color='black';\" onmouseout=\"this.style.color='white';\">#{input}</span>"
    end
  end
end
Liquid::Template.register_filter(HideSolutionFilter)

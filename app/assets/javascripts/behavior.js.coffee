$ ->
  $("[data-behavior~=picture]").picture()

  for link in $("[data-behavior~=link_to_unless_current")
    if window.location.href.match link.href
      $(link).addClass("disabled")
      $(link).on "click touchmove", (e)->
        e.preventDefault()
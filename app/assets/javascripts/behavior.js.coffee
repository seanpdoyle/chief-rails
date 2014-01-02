$ ->
  $("[data-behavior~=picture]").picture()

  $("[data-behavior~=image_preview]").on "change", (event)->
    input = event.target
    files = input.files

    imageSelector = $(input).data("preview")

    if imageSelector?
      for file in files when file.type.match("image.*")
        reader = new FileReader()

        reader.onload = ((theFile) ->
          (loadEvent) ->
            $(imageSelector).attr("src", loadEvent.target.result)
        )(file)

        reader.readAsDataURL(file)

  $("[data-behavior~=link_to_unless_current").each (index, link)->
    if window.location.href.match link.href
      $(link).addClass("disabled")
      $(link).on "click touchstart", (e)->
        e.preventDefault()
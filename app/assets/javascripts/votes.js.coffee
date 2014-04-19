# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on "ajax:success", "a[data-update-target]", (evt, data, status, xhr) ->
    #alert "I'm gonna change the vote for this"
    target = $(this).data("update-target")
    #alert target
    #alert $(this).data
    $(target).html data
    console.log data
    return

  $(document).on "ajax:success", "form[data-update-target]", (evt, data, status, xhr) ->
    #alert "I'm gonna change the vote for this"
    target = $(this).data("update-target")
    #alert target
    #alert $(this).data
    $('#' + target).html data
    #console.log data
    return

  return
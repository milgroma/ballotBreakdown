# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@changeVote = (p,v) ->
  if $(this[name = "accept"])
    alert "I'm gonna change the vote for politician " + p
    $('#check_box_' + p).removeClass("changeVote").addClass "abraCadabra"
    $('#check_box_' + p).removeAttr("name").attr "name", "_destroy"
    $('#check_box_' + p).removeAttr("onclick").attr "onclick", "$('#destroy_" + p + "_vote').click();changeVote(" + p + ");"
		$('#check_box_' + p).after('<a id="destroy_' + p + '_vote" style="display:none;" rel="nofollow" href="/votes/' + v + '" data-remote="true" data-method="delete">Destroy</a>')
  return

$ ->
  $("a[data-update-target]").on "ajax:success", (evt, data, status, xhr) ->
    #alert "I'm gonna change the vote for politician "
    target = $(this).data("update-target")
    #alert target
    #alert $(this).data
    $(target).html data
    #console.log data
    return

  return

$ ->
  $("form[data-update-target]").on "ajax:completed", (evt, data, status, xhr) ->
    alert "I'm gonna change the vote for politician "
    target = $(this).data("update-target")
    alert target
    alert $(this).data
    $(target).html data
    console.log data
    return

  return
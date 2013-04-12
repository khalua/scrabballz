window.app =
    selected_channel: null
    pusher: null
    ready: ->
        $('#channels').on('click', '.channel', app.select_channel)
        app.pusher = new Pusher('ee4f9b0c402d6528a02c')
    select_channel: ->
        app.selected_channel.removeClass('selected_channel') if app.selected_channel

        if app.selected_channel && (app.selected_channel[0] == this)
            app.selected_channel = null
        else
            app.selected_channel = $(this)
            app.selected_channel.addClass('selected_channel')

$(document).ready(app.ready)

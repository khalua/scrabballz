window.app =
    selected_cell: null
    selected_channel: null
    pusher: null
    ready: ->
        $('#channels').on('click', '.channel', app.select_cell)
        $('#chat_box').on('click', '#chat_button', app.send_chat)
        app.pusher = new Pusher('ee4f9b0c402d6528a02c')
        $('#chat_box').hide()

    select_cell: ->
        app.selected_cell.removeClass('selected_cell') if app.selected_cell

        if app.selected_cell && (app.selected_cell[0] == this)
          app.selected_cell = null
        else
          app.selected_cell = $(this)
          app.selected_cell.addClass('selected_cell')
          app.select_channel(app.selected_cell.text())

    select_channel: (name) ->
        app.pusher.unsubscribe(app.selected_channel) if app.selected_channel
        app.pusher.subscribe(name)
        app.selected_channel = name
        app.bind_events()
        $('#chat_box').show()

    bind_events: ->
        channel = app.pusher.channels.channels[app.selected_channel]
        channel.bind('chat', app.chat)

    chat: (data) ->
        console.log(data)
        message = $('<div class="message">')
        message.text(data)
        $('#chat_message_list').prepend(message)

    send_chat: (e) ->
        e.preventDefault()
        $('#chat_channel').val(app.selected_channel)
        form = $(this).parent()
        form.submit()
        $('#chat_message').val('').focus()


$(document).ready(app.ready)

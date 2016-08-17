postsChannelFunctions = () ->

    checkMe = (comment_id, username) ->
      unless $('meta[name=admin]').length > 0 || $("meta[user=#{username}]").length > 0
        $(".comment[data-id=#{comment_id}] .content").remove()
      $(".comment[data-id=#{comment_id}]").removeClass("hidden")

    if $('.comment-all').length > 0
      App.posts_channel = App.cable.subscriptions.create {
        channel: "PostsChannel"
      },
      connected: () ->
        console.log("this is passed at connected")

      disconnected: () ->
        console.log("this is passed at disconnected")

      received: (data) ->
        console.log("this is passed at received")
        console.log(data)
        if $('.comment-all').data().id
          $('#comments').append(data.partial)
        checkMe(data.comment.id, data.username)

$(document).on 'turbolinks:load', postsChannelFunctions

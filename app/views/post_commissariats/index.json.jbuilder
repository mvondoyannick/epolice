json.set! :data do
  json.array! @post_commissariats do |post_commissariat|
    json.partial! 'post_commissariats/post_commissariat', post_commissariat: post_commissariat
    json.url  "
              #{link_to 'Show', post_commissariat }
              #{link_to 'Edit', edit_post_commissariat_path(post_commissariat)}
              #{link_to 'Destroy', post_commissariat, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end
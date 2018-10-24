json.set! :data do
  json.array! @bulletins do |bulletin|
    json.partial! 'bulletins/bulletin', bulletin: bulletin
    json.url  "
              #{link_to 'Show', bulletin }
              #{link_to 'Edit', edit_bulletin_path(bulletin)}
              #{link_to 'Destroy', bulletin, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end
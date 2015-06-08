json.media_data @media_data do |media_datum|
  json.partial! 'media_data/media_datum', media_datum: media_datum
end

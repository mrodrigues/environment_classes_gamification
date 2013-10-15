json.array!(@results) do |result|
  json.extract! result, :characteristics, :delta_pollution, :delta_public_support, :delta_corporate_support, :delta_balance, :text, :valid_answer
  json.url result_url(result, format: :json)
end

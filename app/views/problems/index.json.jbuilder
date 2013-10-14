json.array!(@problems) do |problem|
  json.extract! problem, :text, :ends_at
  json.url problem_url(problem, format: :json)
end

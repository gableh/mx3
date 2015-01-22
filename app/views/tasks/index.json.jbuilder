json.array!(@tasks) do |task|
  json.extract! task, :id, :description, :duedate, :completed
  json.url task_url(task, format: :json)
end

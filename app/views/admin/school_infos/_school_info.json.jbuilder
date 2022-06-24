json.extract! school_info, :id, :year, :created_at, :updated_at
json.url admin_school_info_url(school_info, format: :json)

json.extract! review, :id, :description, :rating, :user_id, :product_id, :created_at, :updated_at
json.url review_url(review, format: :json)

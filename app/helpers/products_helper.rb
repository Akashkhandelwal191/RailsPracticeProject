module ProductsHelper

  def calculate_rating(rating)
 
    case rating
  
     when 1..2
      return "Poor"
  
     when 3
      return "Average"
  
     when 4
      return "Good"
  
     else
      return "Excellent"
    end
                         
  end

  def avg_rating(product_id)
    
     product = Product.find_by_id(product_id)
     sum = product.reviews.pluck(:rating).sum
     deno = product.reviews.count
     avg = sum.to_f / deno.to_f
     return avg.round(1)
  end


  def time_ago_in_words(time)
      timestamp = Time.parse(time.to_s)
      current_time = Time.now
      time_difference = (current_time - timestamp).to_i

      case time_difference
      when 0...60
        "#{time_difference} seconds ago"
      when 60...3600
        minutes_ago = time_difference / 60
        "#{minutes_ago} #{pluralize(minutes_ago, 'minute')} ago"
      when 3600...86400
        hours_ago = time_difference / 3600
        "#{hours_ago} #{pluralize(hours_ago, 'hour')} ago"
      when 86400...604800
        days_ago = time_difference / 86400
        "#{days_ago} #{pluralize(days_ago, 'day')} ago"
      when 604800...2419200
        weeks_ago = time_difference / 604800
        "#{weeks_ago} #{pluralize(weeks_ago, 'week')} ago"
      when 2419200...29030400
        months_ago = time_difference / 2419200
        "#{months_ago} #{pluralize(months_ago, 'month')} ago"
      else
        years_ago = time_difference / 29030400
        "#{years_ago} #{pluralize(years_ago, 'year')} ago"
      end
  end

  def pluralize(count, noun)
    count == 1 ? noun : noun + 's'
  end

# Example usage:
# timestamp = Time.parse('2021-09-15 12:00:00') # Replace with your timestamp
# puts time_ago_in_words(timestamp)


end

module BooksHelper

  def isbn10_13(isbn)
    isbn = (isbn).gsub(/[^0-9a-z ]/i, '')
    proceed = isbn.length == 10 ? true : false
    if proceed
      len = isbn.length

      isbn = "978#{isbn.chop!}".split("")
      result = isbn.join("")
      sum = 0

      three_one = [1, 3].cycle(6)
      isbn.each do |v|
        sum += v.to_i * (three_one.next)
      end
      sub_number = 10 - (sum % 10)
      result = "#{result}#{sub_number}"
      if result.length == 13
        result
      else
        "INVALID ISBN"
      end
    else
      "INVALID ISBN"
    end
  end

  def isbn13_10(isbn)
    isbn = isbn.gsub(/[^0-9a-z ]/i, '')
    nine_78 = isbn.slice(0..2) == "978"
    len = isbn.length
    isbn = isbn.slice!(3..11).split("").map(&:to_i)
    proceed = len == 13 ? true : false
    if proceed && nine_78
      sum = isbn.map.with_index{|x,i| (10-i)*x }.sum
      last_num=0
      while true do
        break if (sum+last_num) % 11 == 0
        last_num += 1
      end

      result = "#{isbn.join("")}#{last_num}"

      if result.length > 10
        if (result.slice(-2..-1).to_i == 10)
          "#{result.slice(0..8)}X"
        else
          "INVALID ISBN"
        end
      else
        result
      end
    else
      "INVALID ISBN"
    end
  end


end

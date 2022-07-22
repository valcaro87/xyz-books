

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
      "invalid ISBN"
    else
      result
    end
  end
end

p isbn13_10("9781234567890")
p isbn13_10("9780345391803")
p isbn13_10("9780000000002")
p isbn13_10("9780201882957")
p isbn13_10("9781420951301")
p isbn13_10("9780452284234")
p isbn13_10("9781292101767")

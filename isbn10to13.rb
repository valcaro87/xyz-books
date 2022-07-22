

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
  end
end


p isbn10_13("12508767")
p isbn10_13("1861972717")
p isbn10_13("1665023961")
p isbn10_13("1250805767")
p isbn10_13("007462542X")
p isbn10_13("3-540-49698-X")

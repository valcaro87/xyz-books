

def valid_isbn_10(isbn)
    sum = 0
    if isbn.count("/[^0-9]/i") < 9
        return false
    end
    isbn = isbn.gsub(/[^0-9a-z ]/i, '').split("")
    isbn.each_with_index do |num, i|
        if i < isbn.length - 1
            digit = num.to_i
            if 0 > digit || 9 < digit
                return false
            else
                sum += (digit * (10-i))
            end
        end
    end

    last = isbn.last
    if (last&.downcase != 'x' && (last.to_i < 0 || last.to_i > 9))
        return false
    end

    sum += ((last&.downcase == 'x') ? 10 : last.to_i)
    return sum % 11 == 0
end

p valid_isbn_10("")
p valid_isbn_10("asda1")
p valid_isbn_10("123456790")
p valid_isbn_10("082047267-X")
p valid_isbn_10("0112112425")
p valid_isbn_10("082047267")
p valid_isbn_10("9887401392")
p valid_isbn_10("074324382")

p "---------------------------------"
p valid_isbn_10("007462542X")
p valid_isbn_10("0820472670")
p valid_isbn_10("0470196181")
p valid_isbn_10("074324382X")
p valid_isbn_10("0887401392")
p valid_isbn_10("0887401392")
p valid_isbn_10("012781910X")
p valid_isbn_10("3-540-49698-X")
p valid_isbn_10("3-921099-34-X")
p valid_isbn_10("012781910X")


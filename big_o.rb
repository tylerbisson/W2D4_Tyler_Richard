def my_min(arr) #O(n^2)
    min = arr.first 
    arr.each do |el1|
        arr.each do |el2|
            if el2 < min 
                min = el2
            end
        end
    end
    min 
end

def my_min2(arr) #O(n)
    min = arr.first 
    arr.each do |el1|
        if el1 < min 
            min = el1
        end
    end
    min 
end

def largest_contiguous_sum(arr) #O(n^2)
    sub_arrs = []
    arr.each_with_index do |el1, i1|
        arr.each_with_index do |el2, i2|
            sub_arrs << arr[i1..i2] if i2 > i1
        end
    end

    max = sub_arrs.first.sum
    sub_arrs.each do |list|
        max = list.sum if list.sum > max 
    end
    max 
end

def largest_n(arr)
    if arr.first > 0
        count = 0 
        max = 0
        arr.each do |num| 
            if count + num < 0
                count = 0 
            else 
                count += num 
            end
            if count > max 
                max = count 
            end
        end
    else
        count = 0 
        max = arr.first
        arr.each do |num| 
            if count + num < 0 
                count = 0 
            else 
                count += num 
            end
            if count > max && max > 0 
                max = count 
            elsif num > max
                max = num
            end
        end
    end
    max
end


def largest_n_dry(arr)
        count = 0 
        max = arr.first 
        arr.each do |num| 
            if count + num < 0
                count = 0 
            else 
                count += num 
            end

            if count > max && max > 0 
                max = count 
            elsif num > max
                max = num
            end

        end
    max
end

def first_anagram?(str, str2) #n!
    anagrams = []

    until anagrams.length == fac(str.length)
        x = str.split("").shuffle

        anagrams << x.join("") if !anagrams.include?(x.join(""))

    end

    anagrams.include?(str2)

end

def fac(num)
    if num <= 1
        1
    else
        num * fac(num - 1)
    end
end

def second_anagram?(str1, str2) #n^2
    arr = str2.split("")
    str1.each_char.with_index do |char, i|
        x = arr.find_index(char)
        if x != nil
            found_idx = x
            arr.delete_at(found_idx)
        end
    end
    arr.empty?
end

def third_anagram?(str1, str2)
    alphabet = ("a".."z").to_a
    strings = [str1, str2]
    strings.each do |string|
        sorted = false
        until sorted
            sorted = true
            string.each_char.with_index do |char, i|
                next if i == string.length - 1
                if alphabet.index(char) > alphabet.index(string[i+1])
                    string[i], string[i+1] = string[i+1], string[i]
                    sorted = false
                end
            end
        end
    end

    str1 == str2
end

def fourth_anagram?(str1, str2) #n

    fill_hash(str1) == fill_hash(str2)
    
    
end

def fill_hash(str) 
    hash = Hash.new(0)
 
    str.each_char do |char|
        hash[char] += 1
    end

    return hash
end


def fourth_anagram_one?(str1, str2) 
    hash = Hash.new(0)

    str1.each_char do |char|
        hash[char] += 1
    end
    
    str2.each_char do |char|
        hash[char] -= 1
    end    
    
    !hash.any? {|k, v| v != 0}
end


require "digest"

file = File.read("_input/string.txt")

input = file.strip.to_s

md5 = Digest::MD5.new

md5.update "message1"

total_hash = md5 << file

total_hash = total_hash.to_s

split_hash = total_hash.split(" ")

# puts split_hash

## First Color
color1 = total_hash[0] + total_hash[1] + total_hash[2] + total_hash[3] + total_hash[4] + total_hash[5] + total_hash[6]

## Second Color
color2 = total_hash[7] + total_hash[8] + total_hash[9] + total_hash[10] + total_hash[11] + total_hash[12] + total_hash[13]

## Third Color
color3 = total_hash[14] + total_hash[15] + total_hash[16] + total_hash[17] + total_hash[18] + total_hash[19] + total_hash[20]

## Fourth Color
color4 = total_hash[21] + total_hash[22] + total_hash[23] + total_hash[24] + total_hash[25] + total_hash[26] + total_hash[27]

print "First color:  #" + color1 + "\n"
print "Second color: #" + color2 + "\n"
print "Third color:  #" + color3 + "\n"
print "Fourth color: #" + color4 + "\n"

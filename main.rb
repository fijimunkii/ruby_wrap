# Word wrapping.  This assumes all characters have same width.
def enumwrap(words, maxwidth)
  # if cols is a local variable, 2nd "each" may start with non-zero cols.
  words.split(' ').slice_before(cols: 0) { |w, h|
    h[:cols] += 1 if h[:cols] != 0
    h[:cols] += w.length
    if maxwidth < h[:cols]
      h[:cols] = w.length
      true
    else
      false
    end
  }
end

def wordwrap(words, maxwidth)
  enum = enumwrap(words, maxwidth)
  puts "-=-"*(maxwidth/3)
  enum.each { |ws| puts ws.join(' ') }
  puts "-=-"*(maxwidth/3)
end

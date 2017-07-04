class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    total = 0
    self.each_with_index do |el, idx|
      total += el ^ idx
    end
    total.hash
  end
end

class String
  def hash
    self.chars.map(&:ord).hash
  end
end

class Hash
  def hash
    (self.keys.sort.map{ |el| el.to_s.ord }.hash + self.values.sort.map(&:ord).hash).hash
  end
end

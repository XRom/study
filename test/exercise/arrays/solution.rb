module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.inject {|max, value|  value > max ? value : max } 
        array.collect {|value| value > 0 ? max : value }
      end

      def recursionSearch(ar, start, finish, value)
        n = (start + finish) / 2
        return n if (value == ar[n])
        return -1 if ((start+1) == finish)

        if ar[n] < value
          start = n
        else
          finish = n
        end

        recursionSearch(ar, start, finish, value)
      end

      def search(_array, _query)
        return -1 if _array.empty?
        recursionSearch(_array, 0, _array.size, _query)
      end
    end
  end
end

module Exercise
  module Arrays
    class << self

      def replace(array)
        max = array.reduce() { |max, n| max < n ? n : max }
        array.map { |i| i > 0 ? max : i }
      end

      def search(array, query)
        first_el = 0
        last_el = array.length - 1
        if array.length == 0 || array[first_el] > query || array[last_el] < query
          return -1
        else
          while first_el <= last_el
            pol = (first_el + last_el) / 2
            if array[pol] == query
              return pol 
            elsif array[pol] > query
              last_el = pol - 1
            elsif array[pol] < query
              first_el = pol + 1
            else
            end
          end
          return -1
        end
      end
    end
  end
end

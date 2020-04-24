module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map { |i| i > 0 ? array.max : i }
      end

      def search(array, query)
        mini = 0
        maxi = array.length - 1
        if array.length == 0 || array[mini] > query || array[maxi] < query
          return -1
        else
          while mini <= maxi
            pol = (mini + maxi) / 2
            if array[pol] == query
              return pol 
            elsif array[pol] > query
              maxi = pol - 1
            elsif array[pol] < query
              mini = pol + 1
            else
            end
          end
          return -1
        end
      end
    end
  end
end

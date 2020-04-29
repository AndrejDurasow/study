module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for el in self
          yield el
        end

      end

      # Написать свою функцию my_map
      def my_map
        res = MyArray.new
        self.my_each { |el| res << yield(el)}
        res
      end

      # Написать свою функцию my_compact
      def my_compact
        res = MyArray.new
        self.my_each { |el| res << el unless el.nil? }
        res
      end

      # Написать свою функцию my_reduce
      def my_reduce(res = 0)
        self.my_each { |el| res = res.nil? ? el : yield(res, el) }
        res
      end
    end
  end
end

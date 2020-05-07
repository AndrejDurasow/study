module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(acc = MyArray.new([]), &func)
        first, *tail = self
        acc << first

        yield first

        if tail.empty?
          acc
        else
          MyArray.new(tail).my_each(acc, &func)
        end
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new
        my_reduce(result) { |res, el| res << yield(el) }
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) do |res, el|
          el.nil? ? res : res << el
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &func)
        return acc if empty?

        first_el, *rest = self
        acc = acc.nil? ? first_el : func.call(acc, first_el)
        MyArray.new(rest).my_reduce(acc, &func)
        end
      end
    end
  end

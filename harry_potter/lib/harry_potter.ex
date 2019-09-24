defmodule HarryPotter do
  @moduledoc """
  Once upon a time there was a series of 5 books about a very English hero called Harry. (At least when this Kata was invented,
  there were only 5. Since then they have multiplied) Children all over the world thought he was fantastic, and, of course,
  so did the publisher. So in a gesture of immense generosity to mankind, (and to increase sales) they set up the following
  pricing model to take advantage of Harry’s magical powers.

  One copy of any of the five books costs 8 EUR. If, however, you buy two different books from the series, you get a 5% discount
  on those two books. If you buy 3 different books, you get a 10% discount. With 4 different books, you get a 20% discount.
  If you go the whole hog, and buy all 5, you get a huge 25% discount.

  Note that if you buy, say, four books, of which 3 are different titles, you get a 10% discount on the 3 that form part of a set,
  but the fourth book still costs 8 EUR.

  Potter mania is sweeping the country and parents of teenagers everywhere are queueing up with shopping baskets overflowing with
  Potter books. Your mission is to write a piece of code to calculate the price of any conceivable shopping basket,
  giving as big a discount as possible.
  """
  @price 8
  @discount %{1 => 1, 2 => 0.95, 3 => 0.9, 4 => 0.8, 5 => 0.75}

  def price([]), do: 0

  def price(list) do
    tab = group_books(list)

    Enum.reduce(tab, 0, fn set, total ->
      set_price(set) + total
    end)

    # Enum.reduce(tab, fn set, total ->
    #   IO.inspect("foo")
    #   IO.inspect(set)
    #   IO.inspect(total)
    #   set_price(set) + total
    # end)
  end

  def set_price([]), do: 0

  def set_price(list) do
    count = length(list)
    count * @price * @discount[count]
  end

  # group_books([0]) => [[0]]
  # group_books([0,0]) => [[0], [0]]
  # group_books([0,0,1]) => [[0,1], [0]]
  # group_books([0,0,1,2]) => [[0,1,2], [0]]
  # group_books([0,0,1,2,2,3,4]) => [[0,1,2,3,4], [0,2]]
  # HarryPotter.group_books([0, 0, 1, 1, 2, 2, 3, 4]) => [[0,1,2,3,4], [0,1,2]]
  def group_books([]), do: []

  def group_books(list) do
    list
    |> Enum.reduce([[]], fn tome, set_list ->
      # Find index
      index =
        Enum.find_index(set_list, fn tome_list ->
          !(tome in tome_list)
        end)

      if index != nil do
        # Modify tome_list
        tome_list = set_list |> Enum.at(index)
        tome_list = [tome | tome_list]
        # Change set_list
        List.replace_at(set_list, index, tome_list)
      else
        set_list ++ [[tome]]
      end
    end)
  end
end

defmodule HarryPotterTest do
  use ExUnit.Case
  doctest HarryPotter

  test "price of an empty cart" do
    assert HarryPotter.price([]) == 0
  end

  test "cart with the first tome" do
    assert HarryPotter.price([1]) == 8
  end

  test "cart with the second tome" do
    assert HarryPotter.price([2]) == 8
  end

  test "cart with the third tome" do
    assert HarryPotter.price([3]) == 8
  end

  test "cart with the fourth tome" do
    assert HarryPotter.price([4]) == 8
  end

  test "cart with two different books" do
    # 15.2
    expected_total = 8 * 2 * 0.95

    assert HarryPotter.price([0, 1]) == expected_total
  end

  test "cart with three different books" do
    # 21.6
    expected_total = 8 * 3 * 0.9

    assert HarryPotter.price([0, 2, 4]) == expected_total
  end

  test "cart with four different books" do
    # 25.6
    expected_total = 8 * 4 * 0.8

    assert HarryPotter.price([0, 1, 2, 4]) == expected_total
  end

  test "cart with five different books" do
    # 30
    expected_total = 8 * 5 * 0.75

    assert HarryPotter.price([0, 1, 2, 3, 4]) == expected_total
  end

  test "cart with two different books one of which has two copies" do
    # 23.2
    expected_total = 8 + 8 * 2 * 0.95

    assert HarryPotter.price([0, 0, 1]) == expected_total
  end

  test "cart with two different books each one having two copies" do
    # 34.2
    expected_total = 2 * (8 * 2 * 0.95)

    assert HarryPotter.price([0, 0, 1, 1]) == expected_total
  end

  test "cart with four different books, two of which have two copies" do
    # 40.8
    expected_total = 8 * 4 * 0.8 + 8 * 2 * 0.95

    assert HarryPotter.price([0, 0, 1, 2, 2, 3]) == expected_total
  end

  test "cart with five different books, one of which have two copies" do
    # 38
    expected_total = 8 + 8 * 5 * 0.75
    assert HarryPotter.price([0, 1, 1, 2, 3, 4]) == expected_total
  end

  test "cart with five different books, three of which have two copies" do
    # 51.2
    expected_total = 8 * 5 * 0.75 + 8 * 3 * 0.9

    assert HarryPotter.price([0, 0, 1, 1, 2, 2, 3, 4]) == expected_total
  end

  test "cart with 5 different books, 3 of which have 5 copies and 2 having 4 copies" do
    # 141.2
    expected_total = 3 * (8 * 5 * 0.75) + 2 * (8 * 4 * 0.8)

    cart = [
      0,
      0,
      0,
      0,
      0,
      1,
      1,
      1,
      1,
      1,
      2,
      2,
      2,
      2,
      3,
      3,
      3,
      3,
      3,
      4,
      4,
      4,
      4
    ]

    assert HarryPotter.price(cart) == expected_total
  end
end

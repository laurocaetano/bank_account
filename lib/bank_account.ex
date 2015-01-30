defmodule BankAccount do
  def start do
    await(0)
  end

  def await(acc) do
    receive do
      {:check_balance, pid} -> divulge_balance(pid, acc)
      {:deposit, amount} -> acc = deposit(amount, acc)
      {:withdraw, amount} -> acc = withdraw(amount, acc)
    end

    await(acc)
  end

  defp divulge_balance(pid, acc) do
    send(pid,{:balance, acc})
  end

  defp deposit(amount, acc) do
    acc + amount
  end

  defp withdraw(amount, acc) do
    acc - amount
  end
end

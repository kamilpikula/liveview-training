defmodule LiveViewStudio.Sales do
  def new_orders do
    Enum.random(5..20)
  end

  def sales_ammount do
    Enum.random(100..1000)
  end

  def satisfaction do
    Enum.random(96..100)
  end
end

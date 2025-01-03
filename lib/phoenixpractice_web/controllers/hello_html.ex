defmodule PhoenixpracticeWeb.HelloHTML do
  use PhoenixpracticeWeb, :html

  embed_templates "hello_html/*"

  attr :my_name, :string, default: "John"
  def my_component(assigns) do
    ~H"""
    <h2>
      Hello! This is my component and my name is {@my_name}
    </h2>
    """
  end
end

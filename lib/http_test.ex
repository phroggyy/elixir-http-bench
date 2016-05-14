defmodule HttpTest do
  use Plug.Router
  require Logger

  plug Plug.Logger
  plug :match
  plug :dispatch

  def init(options) do
    options
  end

  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy.http HttpTest, []
  end

  get "/" do
    conn
    |> put_resp_header("Location", "http://www.google.com")
    |> send_resp(302, "")
    |> halt
  end

  get "/bench" do
    conn
    |> send_resp(204, "ok")
    |> halt
  end
end

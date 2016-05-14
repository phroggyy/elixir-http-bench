defmodule HttpTest.Api do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(HttpTest, [])
    ]

    opts = [strategy: :one_for_one, name: HttpTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
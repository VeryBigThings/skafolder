defmodule Mix.Tasks.Skf.Gen.Credo do
  use Mix.Task

  @templates [
    Path.join(["skf.gen.credo", "config", ".credo.exs"])
  ]

  @shortdoc "Generate credo config file"
  def run(_args) do
    if Mix.Project.umbrella?() do
      Mix.raise("mix phx.gen.json can only be run inside an application directory")
    end

    app = Mix.Project.config()[:app]

    bindings = Keyword.merge([app: app], [])

    Enum.each(@templates, fn tpl ->
      tpl
      |> Skafolder.eval_from_templates(bindings)
      |> Skafolder.generate_file(Path.join([File.cwd!(), Path.basename(tpl)]))
    end)
  end
end

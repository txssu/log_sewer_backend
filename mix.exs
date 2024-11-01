defmodule LogSewerBackend.MixProject do
  use Mix.Project

  def project do
    [
      app: :log_sewer_backend,
      description: "Backend for use with LogSewer",
      version: "0.0.2",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      dialyzer: [
        plt_add_apps: [:mix],
        plt_file: {:no_warn, "priv/plts/dialyzer.plt"},
        plt_core_path: "priv/plts/core.plt",
        ignore_warnings: ".dialyzer_ignore.exs"
      ],
      docs: [
        main: "readme",
        extras: ["README.md"]
      ],
      package: package()
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/txssu/log_sewer_backend"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:finch, "~> 0.19"},
      {:jason, "~> 1.4"},
      {:castore, "~> 1.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      # Code quality
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:mix_audit, "~> 2.1", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:styler, "~> 1.1", only: [:dev, :test], runtime: false}
    ]
  end

  defp aliases do
    [
      ci: [
        "compile --all-warnings --warnings-as-errors",
        "format --check-formatted",
        "credo --strict",
        "deps.audit",
        "dialyzer"
      ]
    ]
  end
end

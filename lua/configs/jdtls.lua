local jdtls = require "jdtls"

-- Determine project root (e.g., where build.gradle or pom.xml lives)
local root_markers = { "gradlew", "mvnw", ".git" }
local root_dir = require("jdtls.setup").find_root(root_markers)

-- Exit if not inside a Java project
if not root_dir then
  return
end

-- Workspace location for jdtls data
local workspace_folder = vim.fn.stdpath "data" .. "/site/java/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

-- mason packages
local mason_path = vim.fn.stdpath "data" .. "/mason/packages"
local bundles = {
  vim.fn.glob(mason_path .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true),
}

local cmd = {
  "java",
  "-Declipse.application=org.eclipse.jdt.ls.core.id1",
  "-Dosgi.bundles.defaultStartLevel=4",
  "-Dlog.protocol=true",
  "-Dlog.level=ALL",
  "-Xmx1g",
  "--add-modules=ALL-SYSTEM",
  "--add-opens",
  "java.base/java.util=ALL-UNNAMED",
  "--add-opens",
  "java.base/java.lang=ALL-UNNAMED",
  "-jar",
  vim.fn.glob(mason_path .. "/jdtls/plugins/org.eclipse.equinox.launcher_*.jar", true),
  "-configuration",
  mason_path .. "/jdtls/config_linux",
  "-data",
  workspace_folder,
}
-- Basic jdtls config
local config = {
  cmd = cmd,
  root_dir = root_dir,
  settings = {
    java = {
      eclipse = { downloadSources = true },
      configuration = { updateBuildConfiguration = "interactive" },
      maven = { downloadSources = true },
      implementationsCodeLens = { enabled = true },
      referencesCodeLens = { enabled = true },
      references = { includeDecompiledSources = true },
    },
  },
  init_options = {
    bundles = bundles,
  },
  on_attach = function(client, bufnr)
    jdtls.setup_dap { hotcodereplace = "auto" }
    jdtls.setup.add_commands()

    vim.keymap.set("n", "<leader>jc", "<cmd>JdtCompile<CR>", { silent = true, buffer = bufnr, desc = "Java compile" })
  end,
}

jdtls.start_or_attach(config)

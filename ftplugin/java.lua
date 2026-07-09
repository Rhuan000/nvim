local jdtls = require("jdtls")

local root_markers = {
  "pom.xml",
  "build.gradle",
  "build.gradle.kts",
  "settings.gradle",
  "settings.gradle.kts",
  "mvnw",
  "gradlew",
  ".git",
}

local function glob_jars(pattern)
  local matches = vim.split(vim.fn.glob(pattern, 1), "\n", { plain = true })
  local jars = {}
  for _, path in ipairs(matches) do
    if path ~= "" then
      table.insert(jars, path)
    end
  end
  return jars
end

local data_path = vim.fn.stdpath("data")
local java_debug_jar = data_path .. "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
local java_test_jars = data_path .. "/mason/packages/java-test/extension/server/*.jar"

local bundles = glob_jars(java_debug_jar)
for _, jar in ipairs(glob_jars(java_test_jars)) do
  local name = vim.fn.fnamemodify(jar, ":t")
  if name ~= "com.microsoft.java.test.runner-jar-with-dependencies.jar" and name ~= "jacocoagent.jar" then
    table.insert(bundles, jar)
  end
end

local config = {
  cmd = { "jdtls" },
  root_dir = vim.fs.root(0, root_markers),
  init_options = {
    bundles = bundles,
  },
  settings = {
    java = {
      format = {
        enabled = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      autobuild = {
        enabled = true,
      },
    },
  },
}

jdtls.start_or_attach(config, {
  dap = {
    hotcodereplace = "auto",
  },
})

vim.keymap.set("n", "<leader>jt", function()
  require("jdtls").test_class()
end, { buffer = true, desc = "Run Java test class" })

vim.keymap.set("n", "<leader>jn", function()
  require("jdtls").test_nearest_method()
end, { buffer = true, desc = "Run nearest Java test" })

vim.keymap.set("n", "<leader>jd", function()
  require("jdtls.dap").setup_dap_main_class_configs({ verbose = true })
end, { buffer = true, desc = "Refresh Java debug configs" })

vim.keymap.set("n", "<leader>jr", function()
  require("jdtls").update_projects_config()
end, { buffer = true, desc = "Refresh Java project config" })

local jdtls = require("jdtls")
local root_dir = require("jdtls.setup").find_root({
  "mvnw",
  "gradlew",
  "pom.xml",
  "build.gradle",
  ".git",
})

if root_dir == "" then
  return
end

local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

local config = {
  cmd = { "jdtls" },
  root_dir = root_dir,
  workspace_folder = workspace_dir,
  settings = {
    java = {
      maven = {
        downloadSources = true,
      },
    },
  },
}

jdtls.start_or_attach(config)

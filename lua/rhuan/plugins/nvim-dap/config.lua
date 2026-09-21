local M = {}

local ok, dap = pcall(require, "dap")
if not ok then
  return M
end

local host = "127.0.0.1"
local port = 5005

local quarkus_attach = {
  type = "java",
  request = "attach",
  name = "Quarkus: attach to dev mode (localhost:5005)",
  hostName = host,
  port = port,
}

dap.configurations.java = dap.configurations.java or {}

local has_quarkus_config = vim.iter(dap.configurations.java):any(function(config)
  return config.name == quarkus_attach.name
end)

if not has_quarkus_config then
  table.insert(dap.configurations.java, 1, quarkus_attach)
end

local function java_debugger_ready()
  local clients = vim.lsp.get_clients({ name = "jdtls" })
  if #clients == 0 or not dap.adapters.java then
    vim.notify(
      "Abra um arquivo Java do projeto e aguarde o jdtls iniciar antes de conectar o debugger.",
      vim.log.levels.WARN
    )
    return false
  end

  return true
end

function M.attach_quarkus()
  if java_debugger_ready() then
    dap.run(vim.deepcopy(quarkus_attach))
  end
end

local function find_quarkus_command()
  local wrapper_root = vim.fs.root(0, {
    "mvnw.cmd",
    "mvnw",
    "gradlew.bat",
    "gradlew",
  })
  local project_root = wrapper_root or vim.fs.root(0, {
    "pom.xml",
    "build.gradle",
    "build.gradle.kts",
  })

  if not project_root then
    return nil, nil, "Nenhum projeto Maven ou Gradle encontrado."
  end

  local is_windows = vim.fn.has("win32") == 1
  local function windows_batch(command)
    return { "cmd.exe", "/d", "/c", command }
  end

  local maven_wrapper = vim.fs.joinpath(project_root, is_windows and "mvnw.cmd" or "mvnw")
  if vim.uv.fs_stat(maven_wrapper) then
    local command = is_windows and windows_batch(maven_wrapper) or { maven_wrapper }
    vim.list_extend(command, { "quarkus:dev", "-Ddebug=5005", "-Dsuspend=y" })
    return project_root, command
  end

  local gradle_wrapper = vim.fs.joinpath(project_root, is_windows and "gradlew.bat" or "gradlew")
  if vim.uv.fs_stat(gradle_wrapper) then
    local command = is_windows and windows_batch(gradle_wrapper) or { gradle_wrapper }
    vim.list_extend(command, { "--console=plain", "quarkusDev", "-Ddebug=5005", "-Dsuspend=y" })
    return project_root, command
  end

  if vim.uv.fs_stat(vim.fs.joinpath(project_root, "pom.xml")) and vim.fn.executable("mvn") == 1 then
    return project_root, { "mvn", "quarkus:dev", "-Ddebug=5005", "-Dsuspend=y" }
  end

  if
    (vim.uv.fs_stat(vim.fs.joinpath(project_root, "build.gradle"))
      or vim.uv.fs_stat(vim.fs.joinpath(project_root, "build.gradle.kts")))
    and vim.fn.executable("gradle") == 1
  then
    return project_root, { "gradle", "--console=plain", "quarkusDev", "-Ddebug=5005", "-Dsuspend=y" }
  end

  return nil, nil, "Wrapper Maven/Gradle não encontrado e nenhuma instalação global está disponível."
end

local function wait_for_debug_port(attempts)
  local uv = vim.uv or vim.loop
  local socket = uv.new_tcp()

  socket:connect(host, port, function(err)
    socket:close()
    vim.schedule(function()
      if not err then
        M.attach_quarkus()
      elseif attempts > 1 then
        vim.defer_fn(function()
          wait_for_debug_port(attempts - 1)
        end, 500)
      else
        vim.notify("Quarkus não abriu a porta de debug 5005 em 60 segundos.", vim.log.levels.ERROR)
      end
    end)
  end)
end

function M.start_quarkus()
  if not java_debugger_ready() then
    return
  end

  local root, command, err = find_quarkus_command()
  if not command then
    vim.notify(err, vim.log.levels.ERROR)
    return
  end

  vim.cmd("botright 12new")
  local bufnr = vim.api.nvim_get_current_buf()
  vim.bo[bufnr].buflisted = false

  local job_id = vim.fn.jobstart(command, {
    cwd = root,
    term = true,
  })

  if job_id <= 0 then
    vim.cmd("close")
    vim.notify("Não foi possível iniciar o Quarkus dev mode.", vim.log.levels.ERROR)
    return
  end

  vim.cmd("startinsert")
  vim.notify("Quarkus iniciando; o debugger conectará automaticamente na porta 5005.")
  wait_for_debug_port(120)
end

return M

# Neovim

Configuração pessoal para desenvolvimento com Java/Quarkus, Rust, TypeScript,
C/C++, Solidity e YAML. Inclui LSP, Treesitter, Telescope, Git, CodeCompanion,
Codex, Copilot e debug Java com `nvim-dap`.

Esta configuração requer **Neovim 0.11 ou mais recente** e **Java 21**.

## Instalação no Windows (PowerShell)

Execute o PowerShell como usuário normal. O `winget` pedirá elevação somente
quando um instalador precisar dela.

### 1. Instalar as dependências

```powershell
winget install --id Git.Git --exact
winget install --id Neovim.Neovim --exact
winget install --id BurntSushi.ripgrep.MSVC --exact
winget install --id OpenJS.NodeJS.LTS --exact
winget install --id EclipseAdoptium.Temurin.21.JDK --exact
winget install --id JesseDuffield.lazygit --exact
winget install --id LLVM.LLVM --exact
winget install --id Rustlang.Rustup --exact
```

Feche e reabra o PowerShell para atualizar o `PATH`. Depois confira:

```powershell
nvim --version
git --version
rg --version
node --version
npm --version
java --version
lazygit --version
clang --version
rustup default stable
rustup component add clippy
```

O `clang` é usado para compilar parsers do Treesitter. Rust e Clippy só são
necessários para projetos Rust.

### 2. Clonar a configuração

O bloco abaixo preserva uma configuração anterior, em vez de apagá-la.

```powershell
$NvimConfig = Join-Path $env:LOCALAPPDATA "nvim"

if (Test-Path -LiteralPath $NvimConfig) {
    $Backup = "$NvimConfig.backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
    Move-Item -LiteralPath $NvimConfig -Destination $Backup
    Write-Host "Configuração anterior movida para $Backup"
}

git clone https://github.com/Rhuan000/nvim.git $NvimConfig
```

### 3. Instalar plugins, LSPs e debugger Java

```powershell
nvim --headless "+Lazy! sync" +qa
nvim --headless "+MasonInstall jdtls java-debug-adapter java-test clangd rust-analyzer typescript-language-server yaml-language-server vscode-solidity-server" +qa
```

Se uma instalação do Mason não terminar no modo headless, abra `nvim`, execute
`:Mason` e instale o pacote que estiver marcado como ausente.

### 4. Instalar Codex e o adaptador do CodeCompanion

O Codex CLI tem instalador oficial próprio para Windows. O `codex-acp` usa o
Node.js e conecta o CodeCompanion ao Codex.

```powershell
powershell -ExecutionPolicy Bypass -Command "irm https://chatgpt.com/codex/install.ps1 | iex"
npm install --global @agentclientprotocol/codex-acp
codex --version
codex
```

Na primeira execução de `codex`, escolha **Sign in with ChatGPT**. Para o
Copilot, abra o Neovim e execute `:Copilot auth`.

### 5. Validar a instalação

```powershell
nvim "+checkhealth"
```

Dentro do Neovim, também são úteis `:Lazy`, `:Mason`, `:LspInfo` e
`:checkhealth vim.lsp`.

## Instalação no Debian/Ubuntu

Os comandos abaixo consideram uma máquina Linux x86_64. Em ARM64, troque o
arquivo do Neovim por `nvim-linux-arm64.tar.gz`.

### 1. Dependências básicas e Java 21

```bash
sudo apt update
sudo apt install -y git curl ca-certificates unzip tar gzip ripgrep \
  build-essential xclip wl-clipboard openjdk-21-jdk maven

java --version
javac --version
```

Em uma distribuição cuja versão não ofereça `openjdk-21-jdk`, instale um JDK
21 (por exemplo, Temurin 21) antes de continuar. O JDTLS atual precisa de Java
21 para iniciar.

### 2. Instalar Neovim atual

O Neovim empacotado por versões antigas do Debian pode ser velho demais para
esta configuração. Estes são os comandos do arquivo oficial mais recente:

```bash
cd /tmp
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
nvim --version
```

### 3. Instalar Node.js LTS

O Node/npm é necessário para `codex-acp` e para ferramentas TypeScript.

```bash
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs
node --version
npm --version
```

### 4. Instalar Rust/Clippy e LazyGit

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"
rustup component add clippy

cd /tmp
LAZYGIT_VERSION="$(curl -fsSL https://api.github.com/repos/jesseduffield/lazygit/releases/latest | sed -n 's/.*"tag_name": "v\([^"]*\)".*/\1/p')"
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin/lazygit
lazygit --version
```

Rust e Clippy são opcionais se você não desenvolve em Rust. LazyGit também é
opcional; sem ele, apenas o atalho `<leader>gg` não funcionará.

### 5. Clonar a configuração e instalar os componentes

```bash
NVIM_CONFIG="$HOME/.config/nvim"

if [ -e "$NVIM_CONFIG" ]; then
  BACKUP="${NVIM_CONFIG}.backup-$(date +%Y%m%d-%H%M%S)"
  mv "$NVIM_CONFIG" "$BACKUP"
  printf 'Configuração anterior movida para %s\n' "$BACKUP"
fi

git clone https://github.com/Rhuan000/nvim.git "$NVIM_CONFIG"
nvim --headless "+Lazy! sync" +qa
nvim --headless "+MasonInstall jdtls java-debug-adapter java-test clangd rust-analyzer typescript-language-server yaml-language-server vscode-solidity-server" +qa
```

### 6. Instalar Codex e CodeCompanion

```bash
curl -fsSL https://chatgpt.com/codex/install.sh | sh
npm install --global @agentclientprotocol/codex-acp
codex --version
codex
nvim "+checkhealth"
```

Na primeira execução, autentique com **Sign in with ChatGPT**. Para o Copilot,
execute `:Copilot auth` dentro do Neovim.

## JBoss/WildFly pela linha de comando

Sim, é possível. O Eclipse não possui um servidor JBoss especial: o adaptador
da aba **Servers** inicia os scripts da instalação, publica o `.war` e conversa
com a API de gerenciamento. Você pode fazer as mesmas etapas no terminal.

Os comandos abaixo servem para WildFly e para versões modernas do JBoss EAP.
Substitua o caminho de `JBOSS_HOME` pela pasta que contém `bin`, `standalone` e
`modules`.

### Windows PowerShell

Defina a instalação para a sessão atual e inicie o modo standalone:

```powershell
$env:JBOSS_HOME = "C:\tools\wildfly-40.0.0.Final"
& "$env:JBOSS_HOME\bin\standalone.bat"
```

Deixe esse terminal aberto. Em outro PowerShell:

```powershell
$env:JBOSS_HOME = "C:\tools\wildfly-40.0.0.Final"

# Testar a conexão com a administração
& "$env:JBOSS_HOME\bin\jboss-cli.bat" --connect --command=":read-attribute(name=server-state)"

# Compilar uma aplicação Maven
.\mvnw.cmd clean package

# Publicar ou substituir o WAR
& "$env:JBOSS_HOME\bin\jboss-cli.bat" --connect --command="deploy C:\caminho\projeto\target\aplicacao.war --force"

# Listar deployments
& "$env:JBOSS_HOME\bin\jboss-cli.bat" --connect --command="deployment-info"

# Remover o deployment
& "$env:JBOSS_HOME\bin\jboss-cli.bat" --connect --command="undeploy aplicacao.war"

# Encerrar o servidor corretamente
& "$env:JBOSS_HOME\bin\jboss-cli.bat" --connect --command="shutdown"
```

Para tornar `JBOSS_HOME` persistente para seu usuário:

```powershell
[Environment]::SetEnvironmentVariable("JBOSS_HOME", "C:\tools\wildfly-40.0.0.Final", "User")
```

### Debian/Ubuntu

```bash
export JBOSS_HOME="$HOME/tools/wildfly-40.0.0.Final"
"$JBOSS_HOME/bin/standalone.sh"
```

Deixe o servidor aberto e use outro terminal:

```bash
export JBOSS_HOME="$HOME/tools/wildfly-40.0.0.Final"

"$JBOSS_HOME/bin/jboss-cli.sh" --connect --command=':read-attribute(name=server-state)'
./mvnw clean package
"$JBOSS_HOME/bin/jboss-cli.sh" --connect --command="deploy $PWD/target/aplicacao.war --force"
"$JBOSS_HOME/bin/jboss-cli.sh" --connect --command='deployment-info'
"$JBOSS_HOME/bin/jboss-cli.sh" --connect --command='undeploy aplicacao.war'
"$JBOSS_HOME/bin/jboss-cli.sh" --connect --command='shutdown'
```

Para persistir a variável:

```bash
printf '\nexport JBOSS_HOME="$HOME/tools/wildfly-40.0.0.Final"\n' >> "$HOME/.bashrc"
source "$HOME/.bashrc"
```

Por padrão, a aplicação fica em `http://localhost:8080` e o console de
administração em `http://localhost:9990/console`.

### Debug do JBoss no Neovim

Inicie a JVM do JBoss expondo JDWP na porta 5005:

```powershell
# Windows
& "$env:JBOSS_HOME\bin\standalone.bat" --debug 5005
```

```bash
# Linux
"$JBOSS_HOME/bin/standalone.sh" --debug 5005
```

Depois abra um arquivo Java do projeto no Neovim, aguarde o JDTLS iniciar e
pressione `<leader>da`. Embora o nome atual do atalho diga “Quarkus”, ele faz
um attach Java genérico em `127.0.0.1:5005`, portanto também funciona com
JBoss/WildFly. Use `<leader>db` para marcar breakpoints e `<F5>` para continuar.

O argumento `--debug` inicia o JDWP com `suspend=n`: a JVM não espera pelo
debugger. Se precisar capturar código executado durante a própria inicialização,
inicie com uma opção JDWP explícita e `suspend=y`:

```powershell
# Windows: a JVM para antes do boot e espera o attach na porta 5005
$env:JAVA_OPTS = "$env:JAVA_OPTS -agentlib:jdwp=transport=dt_socket,address=*:5005,server=y,suspend=y"
& "$env:JBOSS_HOME\bin\standalone.bat"
```

```bash
# Linux: a JVM para antes do boot e espera o attach na porta 5005
export JAVA_OPTS="${JAVA_OPTS:-} -agentlib:jdwp=transport=dt_socket,address=*:5005,server=y,suspend=y"
"$JBOSS_HOME/bin/standalone.sh"
```

Nesse caso, conecte com `<leader>da`; o boot continua assim que o debugger se
anexa. Não combine essa forma com `--debug`, pois ambas configuram o JDWP.

O modo normal para desenvolvimento local é **standalone**. `domain.bat` e
`domain.sh` são destinados ao managed domain, quando vários servidores são
administrados por um controlador central.

## Quarkus pela linha de comando

Quarkus não precisa de JBoss/WildFly externo: no modo dev ele inicia sua própria
JVM. Os equivalentes do atalho `<leader>dq` são:

```powershell
# Windows, Maven Wrapper
.\mvnw.cmd quarkus:dev -Ddebug=5005 -Dsuspend=y

# Windows, Gradle Wrapper
.\gradlew.bat --console=plain quarkusDev -Ddebug=5005 -Dsuspend=y
```

```bash
# Linux, Maven Wrapper
chmod +x mvnw
./mvnw quarkus:dev -Ddebug=5005 -Dsuspend=y

# Linux, Gradle Wrapper
chmod +x gradlew
./gradlew --console=plain quarkusDev -Ddebug=5005 -Dsuspend=y
```

Com `suspend=y`, a JVM abre a porta 5005 e espera o debugger. Em seguida use
`<leader>da`. O atalho `<leader>dq` já inicia o comando correto, espera a porta
5005 e conecta automaticamente.

## Atalhos

A relação atualizada de atalhos fica em
[`lua/rhuan/shortcuts.md`](lua/rhuan/shortcuts.md). Dentro do Neovim, o
WhichKey também mostra os grupos disponíveis ao pressionar `<leader>`.

Atalhos principais:

| Atalho | Ação |
| --- | --- |
| `<leader>ft` | Abrir/fechar árvore de arquivos |
| `<leader>fe` | Mostrar erros |
| `<leader>cc` | Abrir o CodeCompanion à direita |
| `<leader>ci` | Chat inline na linha/seleção atual |
| `<C-s>` | Enviar mensagem no CodeCompanion |
| `<leader>dq` | Iniciar Quarkus e conectar o debugger |
| `<leader>da` | Conectar à JVM na porta 5005 |
| `<leader>db` | Alternar breakpoint |
| `<leader>de` | Avaliar expressão no debugger |
| `<M-h>` / `<M-l>` | Diminuir/aumentar largura da janela |
| `<M-m>` / `<M-i>` | Diminuir/aumentar altura da janela |

## Referências oficiais

- [Instalação do Neovim](https://neovim.io/doc/install/)
- [Codex CLI](https://learn.chatgpt.com/docs/codex/cli?translationFallback=pt-BR)
- [WildFly Admin Guide](https://docs.wildfly.org/40/Admin_Guide.html)
- [Documentação do JBoss EAP](https://docs.redhat.com/en/documentation/red_hat_jboss_enterprise_application_platform/8.0/)

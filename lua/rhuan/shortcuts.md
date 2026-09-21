# Neovim Keymaps

## Explorer and Files

| Key | Action |
| --- | --- |
| `<leader>pv` | Explore directory with netrw |
| `<leader>ff` | Find files with Telescope |
| `<leader>ft` | Toggle the file tree |
| `<leader>fg` | Search text with Telescope |
| `<leader>fd` | Reveal the current file in the tree |
| `<leader>fb` | Open Telescope file browser |

## Buffers

| Key | Action |
| --- | --- |
| `<M-1>` | Previous buffer |
| `<M-2>` | Next buffer |
| `<M-$>` | Close current buffer |

## Windows and Splits

| Key | Action |
| --- | --- |
| `<M-h>` | Decrease the current split width |
| `<M-l>` | Increase the current split width |
| `<M-i>` | Increase the current split height |
| `<M-m>` | Decrease the current split height |

## Editing

| Key | Action |
| --- | --- |
| `<leader>s` | Start substitute in the current file |
| `<leader>y` | Yank selection to system clipboard |
| `<leader>Y` | Yank current line to system clipboard |
| `<CR>` in normal mode | Insert an empty line below |
| `<BS>` in normal mode | Insert an empty line above |
| `<M-j>` / `<M-k>` | Move the current line or selection |

## Harpoon

| Key | Action |
| --- | --- |
| `<leader>ha` | Add current file to Harpoon |
| `<leader>hh` | Toggle Harpoon menu |
| `<leader>h1` | Jump to Harpoon file 1 |
| `<leader>h2` | Jump to Harpoon file 2 |
| `<leader>h3` | Jump to Harpoon file 3 |
| `<leader>h4` | Jump to Harpoon file 4 |

## Git

| Key | Action |
| --- | --- |
| `<leader>gg` | Open LazyGit |
| `<leader>gb` | Blame current line |
| `<leader>gB` | List Git branches |
| `<leader>gp` | Preview current hunk |
| `<leader>ga` | Stage current hunk |
| `<leader>gA` | Stage the current buffer |
| `<leader>gr` | Reset current hunk |
| `<leader>gn` | Next hunk |
| `<leader>gN` | Previous hunk |
| `<leader>gc` | Create a Git commit |

## Git Tools

| Key | Action |
| --- | --- |
| Fugitive commands | Advanced git actions from `:Git`, `:Gstatus`, `:Gdiff`, etc. |

## Diagnostics and LSP

| Key | Action |
| --- | --- |
| `<leader>di` | Open floating diagnostics |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>fe` | Show errors with Telescope |
| `<leader>fw` | Show warnings with Telescope |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Go to references |
| `K` | Show hover documentation |
| `<leader>gs` | List document symbols |
| `<leader>cA` | Show code actions |

## AI and Code Review

| Key | Action |
| --- | --- |
| `<leader>cc` | Toggle CodeCompanion chat |
| `<leader>ci` | Open inline assistant for the current line or visual selection |
| `<leader>cl` | Open the Codex CLI through CodeCompanion |
| `<leader>cq` | Send a Quarkus review request to Codex |
| `<leader>cr` | Review agent changes hunk by hunk |
| `<C-s>` in CodeCompanion | Send chat or inline prompt |
| `<C-y>` in insert mode | Accept Copilot or completion suggestion |

## Debugging

| Key | Action |
| --- | --- |
| `<F5>` | Continue debugging |
| `<F10>` | Step over |
| `<F11>` | Step into |
| `<F12>` | Step out |
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Set conditional breakpoint |
| `<leader>dr` | Open DAP REPL |
| `<leader>du` | Toggle DAP UI |
| `<leader>dl` | Run last debug config |
| `<leader>de` | Evaluate the word or visual selection in a float |
| `<leader>dw` | Add the word or visual selection to watches |
| `<leader>da` | Attach debugger to Quarkus on port 5005 |
| `<leader>dq` | Start Quarkus dev mode and attach automatically |
| `<leader>dt` | Terminate debug session |

## Terminal

| Key | Action |
| --- | --- |
| `<C-x>` in terminal mode | Return to normal mode |
| `<C-\>` | Toggle the ToggleTerm terminal |
| `<leader>tt` | Open terminal |
| `<leader>tv` | Open vertical terminal |
| `<leader>th` | Open horizontal terminal |

## Java / Quarkus

| Key | Action |
| --- | --- |
| `<leader>jt` | Run Java test class |
| `<leader>jn` | Run nearest Java test |
| `<leader>jd` | Refresh Java debug configurations |
| `<leader>jr` | Refresh Java project configuration |

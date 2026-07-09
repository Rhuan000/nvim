# Neovim Keymaps

## Explorer and Files

| Key | Action |
| --- | --- |
| `<leader>pv` | Explore directory with netrw |
| `<leader>ff` | Find files with Telescope |
| `<leader>fe` | Focus the file tree |
| `<leader>ft` | Toggle the file tree |

## Buffers

| Key | Action |
| --- | --- |
| `<M-1>` | Previous buffer |
| `<M-2>` | Next buffer |
| `<M-c>` | Close current buffer |

## Editing

| Key | Action |
| --- | --- |
| `<leader>s` | Start substitute in the current file |
| `<leader>y` | Yank selection to system clipboard |
| `<leader>Y` | Yank current line to system clipboard |

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
| `<leader>gb` | Blame current line |
| `<leader>gp` | Preview current hunk |
| `<leader>gh` | Stage current hunk |
| `<leader>gH` | Reset current hunk |
| `<leader>gn` | Next hunk |
| `<leader>gN` | Previous hunk |

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
| `<leader>gD` | Go to definition |
| `<leader>gR` | Go to references |
| `<leader>gd` | Go to declaration |
| `<leader>gi` | Go to implementation |
| `<leader>gs` | List document symbols |
| `<leader>ch` | Call hierarchy menu |

## AI Chat

| Key | Action |
| --- | --- |
| `<leader>ca` | Toggle AI chat |
| `<leader>cq` | Run the Quarkus review prompt |
| `<leader>cr` | Review the selection |
| `<C-s>` in insert mode | Trigger Copilot suggestion |

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

## Terminal

| Key | Action |
| --- | --- |
| `<Esc>` in terminal mode | Return to normal mode |
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
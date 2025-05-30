# Notes

<!-- do terminal -->
add fzf keybinds
add some snacks
<!-- fix surround -->
<!-- fix hop -->
add visual multi
modified lsp saga
removes displaying filenam and dirctory from lspsaga breadcrumb
by default all codes are folded

add this also
INCREMENTAL SELECTION              *nvim-treesitter-incremental-selection-mod*

Incremental selection based on the named nodes from the grammar.

Query files: `locals.scm`.
Supported options:
- enable: `true` or `false`.
- disable: list of languages.
- keymaps:
  - init_selection: in normal mode, start incremental selection.
    Defaults to `gnn`.
  - node_incremental: in visual mode, increment to the upper named parent.
    Defaults to `grn`.
  - scope_incremental: in visual mode, increment to the upper scope
    (as defined in `locals.scm`). Defaults to `grc`.
  - node_decremental: in visual mode, decrement to the previous named node.
    Defaults to `grm`.

>
  require'nvim-treesitter.configs'.setup {
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
  }
<



## firefox
split
tabs
workspace


## neovim
prefix : <c-space>
<c-hjkl>		widnow.
<c-s-hl>		buffer.
<c-s-jk>		tab.



## tmux
prefix : <a-space>
<a-hjkl>		pane.
<a-s-hl>		window.
<a-s-jk>		session.

## hyprland
prefix : <d-space>
<d-hjkl>		window.
<d-s-hl>		tab.
<d-s-jk>		workspace.

## neovim
<c-w>o widnow open hjkl.
<c-w>x window close hjkl.
<c-w>r widnow resize hjkl.
<c-w>s widnow swap hjkl.

<c-t>o buffer open hl.
<c-t>x buffer close hl
<c-t>s buffer swap hl.

<c-s>o tab open.
<c-s>n tab named.
<c-s>r tab renam.

<c-s>xc tab close current.
<c-s>xo tab close others.
<c-s>xa tab close all (options) 

## tmux
<a-w>o pane open hjkl.
<a-w>x pane close hjkl.
<a-w>r pane resize hjkl.
<a-w>s pane swap hjkl.

<a-t>o window open hl.
<a-t>x window close hl.
<a-t>s window swap hl.

<a-s>o session open
<a-s>n session named.
<a-s>r session renam.

<a-s>xc session close current.
<a-s>xo session close others.
<a-s>xa session close all (optional)



## hyprland
<d-w>o window open (apps)
<d-w>x window close
<d-w>r window resize
<d-w>s window swap

<d-t>o tab open (apps)
<d-t>x tab close
<d-t>x tab swap

<d-s>o workspace open
<d-s>x workspace close




# Tmux
## Pane
- open: left/down/up/right/float : prefix > w > o >> h,j,k,l,f
    - nav: left/down/up/right/previous : prefix > w > o >> <c-h>,<c-j>,<c-k>,<c-l>,<c-p>

- close: left/down/up/right/current/all : prefix > w > x >> h,j,k,l,c,a
    - nav: left/down/up/right/previous : prefix > w > x >> <c-h>,<c-j>,<c-k>,<c-l>,<c-p>

- nav1: left/down/up/right/previous : prefix > h,j,k,l,p
- nav2: left/down/up/right/previous : prefix > w > h,j,k,l,p

- resize: left/down/up/right/maximize : prefix > w > r >> h,j,k,l,m

- swap: left/down/up/right/rotate : prefix > w > s >> h,j,k,l,s 

- break into window: left/right/newLeft/newRight/index: prefix > w > t >> h/l/H/L/i

- list: prefix > w > g

- index: prefix > w > i
 
- layout: prefix > w > L

## Window
- open: left/right : prefix > t > o >> h,l
    - nav: previous/next: prefix > t > o >> <c-h>,<c-j>-<c-k>,<c-l>

- named: left/right : prefix > t > n >> h,l
    - nav: previous/next: prefix > s > o >> <c-h>,<c-j>-<c-k>,<c-l>

- close: left/right/current/others/all : prefix > t > x >> h,l,c,o,a
    - nav: previous/next: prefix > s > o >> <c-h>,<c-j>-<c-k>,<c-l>

- list: prefix > t > g

- rename: prefix > t > r

## Session
- open: prefix > s > o 

- named: prefix > s > n 

- close: current/others/all: prefix > s > x >> c,o,a
    - nav: previous/next: prefix > s > x >> <c-h>,<c-j>-<c-k>,<c-l>

- nav: previous/next: prefix > s >> h,j-k,l
    - nav: 0-9: prefix > s >> 0-9

- list: prefix > s > g

- rename: prefix > s > r

## Client
- list: prefix > c > g


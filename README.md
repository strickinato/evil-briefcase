# Evil Briefcase!

This package provides a vim motion to quickly switch between cases. Hate camelCase? SWAP IT!!!

# Usage (spacemacs)

In your .spacemacs file (`SPC f e d`):

```el

dotspacemacs-additional-packages
'(
  (evil-briefcase :location (recipe :fetcher github :repo "strickinato/evil-briefcase"))
)

```

Then in the user config later in the file:

```el

(defun dotspacemacs/user-config ()
  (evil-briefcase-mode 1)
)

```

# Keybindings

| keybinding | function | case |
|------------|----------|------|
| zc | evil-briefcase-camel-upper | CamelCase            |
| zc | evil-briefcase-camel-lower | camelCase            |
| zS | evil-briefcase-snake-upper | SCREAMING_SNAKE_CASE |
| zs | evil-briefcase-snake-lower | snake_case           |
| zK | evil-briefcase-kebab-upper | FAT-KEBAB-KASE       |
| zk | evil-briefcase-kebab-lower | kebab-kase           |

# Known Annoyances

This overwrites `evil`'s current `zs`, which is `evil-close-fold`. I never use folding, but if you use code folding and don't rely on toggling, then you'll have to remap it back.

These functions are based of the amazing [s.el](https://github.com/magnars/s.el). This made the package easy to write, but it also means that ceratin non text characters get stripped away. eg.


`[:openTheBriefcase]`, with cursor on the `B`:

```el

  zci[ #=> [open_the_briefcase] (we lose the colon)

```

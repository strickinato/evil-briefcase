# Evil Briefcase!

This package provides a vim motion to quickly switch between cases. Hate camelCase? SWAP IT!!!


# Keybindings

```
(evil-define-key '(normal motion visual) evil-briefcase-mode-map
    '(normal motion visual) map "zC" #'evil-briefcase-camel-upper) ;; CamelCase
    '(normal motion visual) map "zc" #'evil-briefcase-camel-lower) ;; camelCase
    '(normal motion visual) map "zS" #'evil-briefcase-snake-upper) ;; SCREAMING_SNAKE_CASE
    '(normal motion visual) map "zs" #'evil-briefcase-snake-lower) ;; snake_case
    '(normal motion visual) map "zK" #'evil-briefcase-kebab-upper) ;; FAT-KEBAB-KASE
    '(normal motion visual) map "zk" #'evil-briefcase-kebab-lower) ;; kebab-kase
```

# Known Annoyances

This overwrites `evil`'s current `zs`, which is `evil-close-fold`. I never use folding, but if you use code folding and don't rely on toggling, then you'll have to remap it back.

These functions are based of the amazing [s.el](https://github.com/magnars/s.el). This made the package easy to write, but it also means that ceratin non text characters get stripped away. eg.


`[:openTheBriefcase]`, with cursor on the `B`:

```
  zci[ #=> [open_the_briefcase] (we lose the colon)

```

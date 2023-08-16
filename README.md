# semantic-pkg-config.el

Add semantic system include conveniently with pkg-config

Well, I did push some modifications to `flycheck-pkg-config`, but recently I found that `semantic-system-include-path` just can not be set directly by `flycheck-pkg-config`. I have to add a little bit more scripts to make it work. This script dependes on `flycheck-pkg-config`, you can find it on elpa, or just use fork it from [here](https://github.com/Wilfred/flycheck-pkg-config) on github.

Run `semantic-pkg-config` to set `semantic-system-include-path` with help of `pkg-config`, if `flycheck-mode` is enabled, it will call `flycheck-pkg-config` as well:)

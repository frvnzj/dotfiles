# Languages that appear in the menu.
TRANS_LANGS='en es de fr el it la'

# Menu program.
DMENU='rofi -dmenu -replace -config ~/.config/rofi/config-translate.rasi'

# Commands that are run to display menus.
DMENU_TEXT=''  # select text to translate
DMENU_LANG='rofi -dmenu -replace -config ~/.config/rofi/config-browser.rasi'  # select language to translate to
DMENU_NEXT='rofi -dmenu -replace -config ~/.config/rofi/config-browser.rasi'  # select what to do with the translation

# Set this to any value if you want to always copy the
# translation (skips DMENU_NEXT menu).
ALWAYS_COPY=

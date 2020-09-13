config.load_autoconfig()

c.downloads.location.directory = '~/downloads'
c.editor.command = ['alacritty', '-e', 'nvim', '{}']
c.editor.encoding = 'utf-8'

#c.qt.args = [ "blink-settings=darkMode=4" ]
c.colors.webpage.darkmode.enabled = True

c.url.start_pages = [
        'qute://bookmarks/#bookmarks',
        ]
c.url.default_page= 'file:///home/muffler/prog/website/index.html'
c.completion.open_categories = ['history']

c.fonts.completion.entry = '10pt Iosevka Fixed'
c.fonts.completion.category = '10pt Iosevka Fixed'
c.fonts.debug_console = '10pt Iosevka Fixed'
c.fonts.downloads = '10pt Iosevka Fixed'
c.fonts.hints = '10pt Iosevka Fixed'
c.fonts.keyhint = '10pt Iosevka Fixed'
c.fonts.messages.info = '10pt Iosevka Fixed'
c.fonts.messages.error = '10pt Iosevka Fixed'
c.fonts.prompts = '10pt Iosevka Fixed'
c.fonts.statusbar = '10pt Iosevka Fixed'
c.fonts.tabs.selected = '10pt Iosevka Fixed'
c.fonts.tabs.unselected = '10pt Iosevka Fixed'

c.scrolling.bar = 'never'

c.tabs.padding = {'bottom' : 3, 'top' : 3, 'left' : 4, 'right' : 4 }
c.tabs.last_close = 'startpage'
c.tabs.indicator.width = 0
c.tabs.title.format = '{current_title}{audio}'
c.tabs.favicons.show = 'never'
c.tabs.title.alignment = 'left'
c.completion.scrollbar.width = 0

# various shortcuts
config.bind('ec', 'config-edit')
config.bind('em', 'spawn mpv {url}')
config.bind('eM', 'hint links spawn mpv {hint-url}')
config.bind('<ctrl-shift-n>', 'open -t file:///home/muffler/prog/website/no.html')
config.bind(';m', 'spawn ~/scripts/bandcampdl {url}')

c.url.searchengines = {
    # search engines
    'DEFAULT' : 'https://searx.be/?q={}',
    'ddg'     : 'https://duckduckgo.com/?q={}',
    # wikis
    'aw'      : 'https://wiki.archlinux.org/index.php?search={}',
    'cw'      : 'http://en.cppreference.com/mwiki/index.php?search={}',
    'rw'      : 'https://doc.rust-lang.org/stable/std/index.html?search={}',
    'ho'      : 'https://hoogle.haskell.org/?hoogle={}',
    # miscellaneous
    'lg'      : 'http://gen.lib.rus.ec/search.php?req={}',
    'gi'      : 'https://github.com/search?q={}',
    'yt'      : 'https://youtube.com/results?search_query={}',
    'mw'      : 'https://www.merriam-webster.com/dictionary/{}',
    # package repos
    'ha'      : 'https://hackage.haskell.org/packages/search?terms={}',
    'purs'    : 'https://pursuit.purescript.org/search?q={}'
}

# quick marks a'la pentadactyl {{{
qsites = {
        'a': 'allegro.pl',
        'b': 'bandcamp.com/_miffi/feed',
        'c': 'codewars.com',
        'd': 'discord.com/channels/@me',
        'e': 'etternaonline.com/user/miffi',
        'f': 'facebook.com',
        'g': 'github.com',
        'h': 'hackage.haskell.org',
        'i': 'instagram.com',
        'j': 'linuxjournal.com',
        'k': 'khanacademy.com',
        'l': 'lichess.org',
        'm': 'mail.tutanota.com',
        'n': 'nofluffjobs.com',
        'o': 'https://osu.ppy.sh/users/11653566',
        'p': 'pursuit.purescript.org',
        'q': 'gcc.godbolt.org',
        'r': 'reddit.com',
        's': 'www.shadertoy.com',
        't': 'monkey-type.com',
        'u': 'trojmiasto.pl',
        'v': 'vimcasts.org',
        'w': 'wiki.archlinux.org',
        'x': 'app.element.io',
        'y': 'youtube.com',
        'z': 'mega.nz' }
for k,v in qsites.items():
        config.bind('gc' + k, 'open ' + v)
        config.bind('gn' + k, 'open -t ' + v)
# }}}

config.source("base16-qutebrowser/themes/minimal/base16-embers.config.py")

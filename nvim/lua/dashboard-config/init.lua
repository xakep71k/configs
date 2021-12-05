vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_header = {[[]]}
vim.g.dashboard_custom_section = {
    a = {description = {'  Find File          '}, command = 'Telescope find_files'},
    d = {description = {'  Search Text        '}, command = 'Telescope live_grep'},
    b = {description = {'  Recent Files       '}, command = 'Telescope oldfiles'},
    e = {description = {'  Config             '}, command = 'edit ~/.config/nvim/init.vim'},
}

math.randomseed(os.clock()*100000000000)
messages = {
    'Do one thing, do it well - Unix Philosophy',
    'Single responsibility principle - Class has one job to do. Each change in requirements can be done by changing just one class.',
    'Open/closed principle - Class is happy (open) to be used by others. Class is not happy (closed) to be changed by others.',
    'Liskov substitution principle - Class can be replaced by any of its children. Children classes inherit parent\'s behaviours.',
    'Interface segregation principle - When classes promise each other something, they should separate these promises (interfaces) into many small promises, so it\'s easier to understand.',
    'Dependency inversion principle - When classes talk to each other in a very specific way, they both depend on each other to never change. Instead classes should use promises (interfaces, parents), so classes can change as long as they keep the promise.',
}
imsg = math.random(#messages)
-- vim.g.dashboard_custom_footer = {messages[imsg]}
vim.g.dashboard_custom_footer = {}

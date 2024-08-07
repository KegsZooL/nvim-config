require 'colorizer'.setup(
    {
        '*'; -- highlighting evreything filetypes
        'css';
        'lua';
        html = { mode = 'background' };
    },
    { mode = 'background' }) -- also we can use 'foreground' mode

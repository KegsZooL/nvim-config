local ok, colorizer = pcall(require, 'colorizer')
if not ok then return end

colorizer.setup(
    {
        '*'; -- highlighting evreything filetypes
        'css';
        'lua';
        html = { mode = 'background' };
    },
    { mode = 'background' }) -- also we can use 'foreground' mode

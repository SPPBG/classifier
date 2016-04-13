function names = getFilenames(filter)
    files = dir(filter);
    names = transpose(extractfield(files,'name'));
end
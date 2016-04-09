function names = getFilenames(filter)
    names = transpose(extractfield(dir(filter),'name'));
end
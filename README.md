# nvim_config


## MacOS
1. Install nvim-packer: 
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

2. Copy contents of this repo to directory:

```
cp -r * ~/.config/nvim/
```

3. Run `:PackerInstall`.

4. Run `:Mason`

## Windows

1. Install nvim-packer
```
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

2. Copy contents of this repo to directory:

```
cp -r * ~/AppData/Local/nvim
```

3. Run `:PackerInstall`.

4. Run `:Mason`.

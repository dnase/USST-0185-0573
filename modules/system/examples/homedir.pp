$root = homedir('root')
$others = homedir('somebody')

notify { "Root's homedir is ${root}": }
notify { "Errybody else's homedir looks like ${others}": }

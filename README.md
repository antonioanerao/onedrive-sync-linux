### Sincronizar pastas específicas do OneDrive em sistemas linux
#### Repositório oficial para instruções completas

    https://github.com/abraunegg/onedrive
    
### Como usar

Faça uma cópia do arquivo config/sync_list para adicionar as pastas que você quer sincronizar

    $ cp config/sync_list.example config/sync_list
    
Opcionalmente faça uma cópia do arquivo config/config para configurações adicionais. Veja a [Documentação Completa](https://github.com/abraunegg/onedrive/tree/master/docs)

    $ cp config/config.example config/config
    
Adicione permissão de execução para o arquivo *start.sh*, *stop.sh* e *clear.sh*

    $ chmod u+x start.sh
    $ chmod u+x stop.sh 
    $ chmod u+x clear.sh 
    
Execute o arquivo *start.sh*. Abra o arquivo para detalhes do que ele está executando. <br>
Após a primeira execução você verá no terminal um link para acessar pelo navegador e acessar sua conta OneDrive.<br>
Após o acesso você verá apenas uma página em branco. Copie o LINK completo da página e cole no terminal.<br>

    $ ./start.sh
    
Quando a sincronização iniciar você verá na tela algo como *Initializing the Synchronization Engine ...*. <br>
Para sair do console do container sem encerrar o container use os atalhos do teclado **CTRL + P + Q**
    
Execute o arquivo stop.sh para parar o container
    
    $ ./stop.sh
    
Para remover permanentemente os arquivos localmente execute o *clear.sh*
O comando removerá o container e depois as pastas e docker voluems criados. 
Não afeta os arquivos remotos.

    $ ./clear.sh

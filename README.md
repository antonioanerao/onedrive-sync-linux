### Sincronizar pastas específicas do OneDrive em sistemas linux
#### Repositório oficial para instruções completas

    https://github.com/abraunegg/onedrive
    
### Como usar

Clone este repositório em qualquer local de sua preferência e acesse a pasta clonada. Seu usuário deve ter permissão de escrita nessa pasta e subpastas

    $ git clone https://github.com/antonioanerao/onedrive-sync-linux.git && cd onedrive-sync-linux

Faça uma cópia do arquivo .env.example com o nome .env <br>
Este arquivo contem as variáveis de ambiente para controlar nome de pastas, volumes e container. Edite conforme necessidade.

    $ cp .env.example .env

Faça uma cópia do arquivo config/sync_list para adicionar as pastas que você quer sincronizar. Se não fizer, *TODO* conteúdo do seu OneDrive será clonado.

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
    
Caso queira pausar o container, execute o arquivo stop.sh
    
    $ ./stop.sh
    
Para remover permanentemente os arquivos localmente execute o *clear.sh*
O comando removerá o container e depois as pastas e docker voluems criados. 
Não afeta os arquivos remotos.

    $ ./clear.sh

Caso queira remover permanentemente o container mas queira deixar as pastas e volumes: (troque onedrive pelo nome do seu container)

    $ docker container rm -f onedrive

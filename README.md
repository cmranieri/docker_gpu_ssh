# Docker

O uso de contêineres é uma estratégia para aumentar a reprodutibilidade de um projeto, além de automatizar os processos de instalação, configuração e execução do código.
Essa abordagem possibilita trabalhar em um ambiente isolado da máquina hospedeira, de forma análoga a uma máquina virtual, mas com menor sobrecarga de recursos e maior portabilidade.

No exemplo apresentado neste repositório, utilizamos como base uma imagem pública do [TensorFlow](https://www.tensorflow.org/install/docker?hl=pt-br), uma das bibliotecas mais populares para aprendizado de máquina.
Diversas outras imagens base estão disponíveis no [Docker Hub](https://hub.docker.com/), muitas delas mais enxutas e voltadas a conjuntos mínimos de funcionalidades.

Seguindo as instruções a seguir, você irá derivar uma nova imagem a partir da imagem base e executar um contêiner com suporte a GPU, incluindo um conjunto exemplificativo de pacotes adicionais pré-instalados.

Como pré-requisitos, o sistema deve ter instalados (i) o [Docker Engine](https://docs.docker.com/engine/) e (ii) o [NVIDIA Container Toolkit](https://github.com/NVIDIA/nvidia-container-toolkit).


## Criando a nova imagem

Uma imagem Docker é um modelo **imutável** usado para criar contêineres.
A imagem contém tudo o que é necessário para executar uma aplicação: sistema operacional base (geralmente uma distribuição Linux mínima), bibliotecas, dependências, variáveis de ambiente e o próprio código da aplicação.

Para criar a nova imagem, precisamos editar um ```Dockerfile```.
Trata-se do arquivo de instruções usado para construir uma imagem Docker.
Ele funciona como um roteiro automatizado que descreve passo a passo como o ambiente deve ser montado.

Neste exemplo, o ```Dockerfile``` se encontra dentro do diretório ```docker```, e o conjunto de comandos necessário para criar a imagem está compilado em um arquivo ```bash```, o qual nomeia a nova imagem como ```my-tf```.
Observe que os pacotes do Python a serem instalados estão sendo obtidos do arquivo ```requirements.txt```, cuja criação é recomendada para qualquer projeto Python.

Assim, para criar a imagem docker, basta rodar:
```
cd docker
bash build-docker.sh
```

O procedimento pode demorar alguns minutos. Ao final, a nova imagem terá sido gerada. Para verificar as imagens disponíveis no ambiente Docker:

```
docker image ls
```

Para remover imagens que não estão sendo utilizadas e poupar espaço, use o seguinte comando, substituindo ```<img_id>``` pelo identificador da imagem a ser removida:
```
docker rmi <img_id>
```



## Rodando o contêiner

O comando ```docker run``` é usado para criar e executar um contêiner a partir de uma imagem. Ele aceita diversos parâmetros que permitem controlar o comportamento do contêiner. Como exemplos, pode-se executar em modo interativo (```-it```), em segundo plano (```-d```), ou montar volumes (```-v```).

### Exemplo básico: Hello world

O exemplo mais simples pode ser obtido através do seguinte comando:
```
docker run hello-world
```

Para um exemplo usando alguns parâmetros, em especial ```-it```, que permite rodar em modo interativo, experimente:
```
docker run -it ubuntu bash
```

### Prosseguindo com o nosso exemplo

Uma maneira de automatizar a criação do contêiner é reunir os comandos em um arquivo ```bash```. No caso do nosso contêiner, você deverá observar o arquivo ```docker/run-docker.sh```.
Note que, a depender da aplicação, será necessário modificar esse script convenientemente.

Note que, no exemplo, estamos criando um **volume** através do parâmetro ```-v```. Um volume do Docker serve para armazenar dados de forma persistente e compartilhada entre o contêiner e o sistema hospedeiro, garantindo que as informações não sejam perdidas quando o contêiner é removido.

Em todo caso, sempre que for rodar o contêiner, rode:
```
bash run-docker.sh
```

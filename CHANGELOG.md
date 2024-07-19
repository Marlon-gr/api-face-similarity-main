# Face Similarity API

Todas as mudanças notáveis serão documentadas neste arquivo.

O formato é baseado em [Keep a Changelog](http://keepachangelog.com/pt-BR/1.0.0/) e este projeto adere ao padrão [Semantic Versioning](http://semver.org/lang/pt-BR/spec/v2.0.0.html).

## [Não liberado]
### Adicionado
### Corrigido
### Modificado
### Obsoleto
### Removido

## [0.2.2](api-face-similarity/tags/0.2.2) - 2020-05-15
    - Correçao do Dockerfile, erro no ENTRYPOINT
    
## [0.2.1](api-face-similarity/tags/0.2.1) - 2020-05-12
    - Versão inicial
    - Endpoint /image/face-distance
    - Integration with  Preprocess API (image/rotate-by-angle)
    - Integration with  Face Detection API (image/face-detect)
    - Integration with  Face Encoding API (image/face-encoding)
    - Error handling (response_error.py)
    - Documentação com swagger disponibilizada no /docs.
    - Logging para /var/log/face_similarity* e /var/log/uwsgi*.
    - Documentation of the classes and methods of the application
    - Update Docker file and enable empacotamento Docker no Jenkinsfile.

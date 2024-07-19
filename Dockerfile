
FROM

ARG build_date
ARG vcs_ref
ARG VERSAO=0.2.2
ARG BOM_PATH="/docker"

LABEL \
    br.com.bb.image.app.sigla="" \
    br.com.bb.image.app.provider="" \
    br.com.bb.image.app.arch="x86_64" \
    br.com.bb.image.app.maintainer="" \
    br.com.bb.image.app.version="$VERSAO" \
    br.com.bb.image.description="" \
    org.label-schema.maintainer="" \
    org.label-schema.vendor="" \
    org.label-schema.url="" \
    org.label-schema.name="" \
    org.label-schema.license="COPYRIGHT" \
    org.label-schema.version="$VERSAO" \
    org.label-schema.vcs-url="" \
    org.label-schema.vcs-ref="$vcs_ref" \
    org.label-schema.build-date="$build_date" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.dockerfile="${BOM_PATH}/Dockerfile"

ENV \
    VERSAO=$VERSAO

RUN mkdir -p /usr/src/app
COPY . /usr/src/app

RUN yum install -y gcc gcc-c++ make cmake python36-devel boost-devel libXext libSM libXrender

ENV CMAKE_C_COMPILER=/usr/bin/gcc CMAKE_CXX_COMPILER=/usr/bin/g++ MODE=prod

WORKDIR /usr/src/app/

RUN python3 -m pip install -U pip && pip install -e .

EXPOSE 9000

# Save Bill of Materials to image. Não remova!
COPY README.md CHANGELOG.md LICENSE Dockerfile ${BOM_PATH}/

WORKDIR /usr/src/app/api_face_similarity/

# Run gunicorn
ENTRYPOINT ["gunicorn", "-c", "config/config.py", "api_face_similarity.main:app"]

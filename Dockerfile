FROM node:12-buster-slim

LABEL version="1.0.0"
LABEL repository="https://github.com/elfisworking/Deply_hexo_to_Tecent_cloud"
LABEL homepage="blog.deepexplore.top"
LABEL maintainer="deepmin@mail.deepexplore.top"

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
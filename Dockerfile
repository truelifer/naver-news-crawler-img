FROM truelifer/python310-scrapy:latest
MAINTAINER truelifer
RUN apt update && \
    apt install -y --no-install-recommends git libmysqlclient-dev pkg-config gcc && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /workspace/naver-news-crawler/git && \
    python3.10 -m pip install sqlalchemy mysqlclient
WORKDIR /workspace/naver-news-crawler/git
RUN git config --global http.sslVerify false && \
    git clone -b main https://github.com/truelifer/naver-news-crawler.git

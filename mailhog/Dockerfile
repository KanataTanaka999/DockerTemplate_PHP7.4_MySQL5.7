#
# ISO-2022-JP 対応の MailHog の Dockerfile
# @see https://bitbucket.org/symfo/pymailhog/src/master/
#

# Python をベースイメージとして指定
# Linux として複雑なことはしないので軽量なディストリである alpine を選択
FROM python:3.10.7-alpine3.16

# ISO-2022-JP 対応である PyMailHog をクローン
RUN apk --no-cache add --virtual build-dependencies \
    git \
  && git clone https://bitbucket.org/symfo/pymailhog.git \
  && apk del build-dependencies \
# mailhog/MailHog にあるパーミッション周りのワークアラウンドを引用。消さない方が無難そう
# @see https://github.com/mailhog/MailHog/blob/e6fa06877ef61ea82bbef234d94bdc75cca478d1/Dockerfile#L18
#
# Add mailhog user/group with uid/gid 1000.
# This is a workaround for boot2docker issue #581, see
# https://github.com/boot2docker/boot2docker/issues/581
  && adduser -D -u 1000 mailhog

# 追加ユーザーである mailhog を実行ユーザーとして指定
USER mailhog
# クローンした PyMailHog をカレントディレクトリに指定
WORKDIR /pymailhog
# この Dockerfile から生成されるイメージを単に実行するのみで
# PyMailHog が動くようにエントリーポイントを設定
ENTRYPOINT ["python", "PyMailHog"]

# メールを送る用のSMTPポート
# 送られた体のメールを見るためのHTTPポート
# で通信を待ち受けすると指定
EXPOSE 1025 8025

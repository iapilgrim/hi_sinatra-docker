FROM howareyou/ruby_2.0.0-p247

ENV HOME /root
ENV PATH /usr/local/lib/2.0.0-p247/bin:$PATH
ENV SERVICE hi-sinatra-docker

RUN mkdir -p /var/apps
ADD ./ /var/apps/$SERVICE
RUN rm -fr /var/apps/$SERVICE/.git
RUN cd /var/apps/$SERVICE && bundle install --local
RUN cd /var/apps/$SERVICE && bin/test

WORKDIR /var/apps/hi-sintra-docker
CMD bin/boot
EXPOSE 4567
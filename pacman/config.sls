# -*- coding: utf-8 -*-
# vim: ft=sls

{% from tpldir ~ "/map.jinja" import pacman with context %}

pacman.config:
  file.managed:
    - name: {{ pacman.config_file }}
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - source: salt://{{ slspath }}/files/pacman.conf.template
    - context:
        config: {{ pacman.config | yaml }}
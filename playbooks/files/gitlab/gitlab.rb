# gitlab.rb

external_url 'https://gitlab.last-try.org'
registry_external_url 'https://registry.last-try.org'

# Nginx
# disabling ssl
nginx['listen_port'] = 80
nginx['listen_https'] = false
registry_nginx['listen_port'] = 5003
registry_nginx['listen_https'] = false

# Unicorns
unicorn['worker_processes'] = 4
unicorn['worker_timeout'] = 60

# Disable services
postgresql['enable'] = false
redis['enable'] = false
prometheus['enable'] = false
postgres_exporter['enable'] = false
redis_exporter['enable'] = false

# Postgres settings
gitlab_rails['db_adapter'] = "postgresql"
gitlab_rails['db_encoding'] = "unicode"

# database service will be named "postgres" in the stack
gitlab_rails['db_host'] = "postgres"
gitlab_rails['db_database'] = "gitlab"
gitlab_rails['db_username'] = "gitlab"
gitlab_rails['db_password'] = "gitlab"
gitlab_rails['gitlab_shell_ssh_port'] = 10022

# Redis settings
# redis service will be named "redis" in the stack
gitlab_rails['redis_host'] = "redis"

# Prometheus exporters
node_exporter['listen_address'] = '0.0.0.0:9100'
gitlab_monitor['listen_address'] = '0.0.0.0'
gitaly['prometheus_listen_addr'] = "0.0.0.0:9236"
gitlab_workhorse['prometheus_listen_addr'] = "0.0.0.0:9229"

# SMTP
gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "postfix"

gitlab_rails['gitlab_email_from'] = 'gitlab@last-try.org'
gitlab_rails['gitlab_email_reply_to'] = 'noreply@last-try.org'

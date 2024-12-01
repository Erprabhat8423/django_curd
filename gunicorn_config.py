""" Gunigorn production cinfiguration file """

import multiprocessing


# user running the application
user = "root"

wsgi_app = "django_curd.wsgi:application"

workers = multiprocessing.cpu_count() * 2 + 1

bind = "0.0.0.0:8000"

# accesslog = "/django/logs/backend-access.log"
# errorlog = "/django/logs/backend-error.log"

capture_output = True

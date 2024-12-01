from django.urls import path
from . import views
from django.conf.urls.static import static
from django.conf import settings
urlpatterns = [
    path('', views.home, name="home"),
    path('add_student/', views.addStudent, name="add_student"),
    path('update_student/<str:pk>/', views.updateStudent, name="update_student"),
    path('delete_student/<str:pk>/', views.deleteStudent, name="delete_student"),
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
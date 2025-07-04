from django.urls import path
from .views import PostListView, PostDetailView, PostCreateView, signup_view

urlpatterns = [
    path('posts/', PostListView.as_view(), name='post-list'),
    path('posts/<int:pk>/', PostDetailView.as_view(), name='post-detail'),
    path('posts/create/', PostCreateView.as_view(), name='post-create'),
    path('signup/', signup_view), 
]

from rest_framework import serializers
from .models import Post

class PostListSerializer(serializers.ModelSerializer):
    summary = serializers.ReadOnlyField()

    class Meta:
        model = Post
        fields = ['id', 'title', 'summary', 'created_at']

class PostDetailSerializer(serializers.ModelSerializer):
    author = serializers.ReadOnlyField(source='author.username')

    class Meta:
        model = Post
        fields = ['id', 'title', 'content', 'author', 'created_at']

class PostCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Post
        fields = ['title', 'content']

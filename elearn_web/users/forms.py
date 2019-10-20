from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

class Signupform(UserCreationForm):
	name = forms.CharField(max_length=50)
	username = forms.EmailField(max_length=300)
	password = forms.CharField(max_length=50)
	rollno = forms.IntegerField()
	branch = forms.CharField(max_length=50)
	semester = forms.IntegerField()

class Loginform(UserCreationForm):
	username = forms.EmailField(max_length=300)
	password = forms.CharField(max_length=50)

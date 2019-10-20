from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from django.urls import reverse_lazy
from django.views import generic
from google.cloud import firestore
from .forms import Signupform
from .forms import Loginform


global set_user
set_user = ""
# Add a new document
db = firestore.Client()
def register(request):
	if request.method == 'POST':
		form = Signupform(request.POST)
		if form.is_valid():
			form.save()
			username = form.cleaned_data.get('username')
			raw_password = form.cleaned_data.get('password')
			rollno = form.cleaned_data.get('rollno')
			branch = form.cleaned_data.get('branch')
			semester = form.cleaned_data.get('semester')
			name = form.cleaned_data.get('name')

			data = {
			    u'password': raw_password,
			    u'Rollno': rollno,
			    u'name': name,
			    u'branch': branch,
			    u'semester': semester
			    
			}

			db.collection(u'USER').document(username).set(data)

			set_user = username
			return redirect('home')
		else:
			print(form.errors)

	else:
		form = Signupform()
		return render(request, 'users/signup.html',{'form': form})			

def login(request):
	
	if request.method == 'POST':
		form = Loginform(request.POST)
		if form.is_valid():
			username = form.cleaned_data.get('username')
			raw_password = form.cleaned_data.get('password')
			doc_ref = db.collection(u'USER').document(username)
			try:
			    doc = doc_ref.get()
			    if (doc['password'] == raw_password):
			    	# verify and send to the home page 
			    	
			    	set_user = username
			    	return redirect('home')
			    else:
			    	# wrong user and send to the login page again
			    	set_user="" 
			    	return redirect('login')
			except google.cloud.exceptions.NotFound:
				print(u'No such document!')
	else:
		form = Loginform()	
		return render(request, 'users/login.html',{'form': form})			
	
	
def logout(request):
	set_user=""
	return render(request, 'login.html')
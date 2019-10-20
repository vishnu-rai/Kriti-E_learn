from django.shortcuts import render
from django.conf import settings
from django.core.files.storage import FileSystemStorage


def home(request):
	if set_user!="":
		return render(request, 'library/library.html')
	# if there is a post request 
	# take the response and search that thing by name through our firestore , create an array for all the results that match and display
	return render(request, 'user/login.html')

# def upload(request):
# 	if  set_user=="":
# 		return render(request, 'user/login.html')
# 	if request.method == 'POST' and request.FILES['myfile']:
# 		fs = FileSystemStorage()
# 		filename = fs.save(myfile.name, myfile)
# 		uploaded_file_url = fs.url(filename)
# 		return render(request, 'library/simple_upload.html', {'uploaded_file_url: uploaded_file_url'})
# 	return render(request, 'library/simple_upload.html')	

#def library(request):
#
#	return render(request, 'library/library.html', {})



def search(request):
	if request.method  == 'POST':
		query=request.POST.get('q')
		if query is not None:
			resource_ref =  db.collection(u'RESOURCES')
			query_ref = resource_ref.where(u'Name', u'==', query).stream()
			arr_books = []
			arr_videos = []
			arr_links = []
			for doc in query_ref:
				dict_object = doc.to_dict()
				if (dict_object['type'] == u'videolink' ):
					arr_links.append(dict_object)
				if (dict_object['type'] == u'book pdf' ):
					arr_books.append(dict_object)
				if (dict_object['type'] == u'video' ):
					arr_videos.append(dict_object)
			return 	render(request,'library/library.html'),arr_videos,arr_books,arr_links
		else:
			return render(request,'library/library.html')
	else:
		return render(request,'library/library.html')			

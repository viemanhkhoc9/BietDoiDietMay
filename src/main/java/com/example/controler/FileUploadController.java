package com.example.controler;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.FileContent;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.DriveScopes;
import com.google.api.services.drive.model.File;
import com.google.api.services.drive.model.ParentReference;
import com.example.exception.ObjectNotFound;
import com.example.exception.StorageFileNotFoundException;

import com.example.model.Category;
import com.example.model.News;
import com.example.service.CategoryService;
import com.example.service.NewsService;
import com.example.service.StorageService;
import com.example.service.UserService;

@Controller
public class FileUploadController {
	/** Application name. */
	private static final String APPLICATION_NAME = "cloud";

	/** Directory to store user credentials for this application. */
	private static final java.io.File DATA_STORE_DIR = new java.io.File(System.getProperty("user.home"),
			".credentials/drive-java-quickstart");

	/** Global instance of the {@link FileDataStoreFactory}. */
	private static FileDataStoreFactory DATA_STORE_FACTORY;

	/** Global instance of the JSON factory. */
	private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();

	/** Global instance of the HTTP transport. */
	private static HttpTransport HTTP_TRANSPORT;

	private static final List<String> SCOPES = Arrays.asList(DriveScopes.DRIVE);

	static {
		try {
			HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
			DATA_STORE_FACTORY = new FileDataStoreFactory(DATA_STORE_DIR);
		} catch (Throwable t) {
			t.printStackTrace();
			System.exit(1);
		}
	}
	@Autowired
	private StorageService storageService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	NewsService newsService;
	@Autowired
	UserService userService;

	@GetMapping("/views-file")
	public String listUploadedFiles(Model model, HttpSession session) throws IOException {
		Object isCategory = session.getAttribute("isCategory");
		Object id = session.getAttribute("id");

		model.addAttribute("files",
				storageService.loadAll()
						.map(path -> MvcUriComponentsBuilder
								.fromMethodName(FileUploadController.class, "serveFile", path.getFileName().toString())
								.build().toString())
						.collect(Collectors.toList()));
		if (isCategory == null || id == null) {
			return "redirect:/";
		} else {
			if (isCategory.toString().equals("true"))
				return "redirect:/category/" + id.toString();
			else {
				try {
					News news = newsService.FindOne((Integer) id);
					return "redirect:/category/" + news.getCategory().getId() + "/news/" + id.toString();
				} catch (ObjectNotFound e) {
					return "redirect:/Admin";
				}
			}
		}
	}

	@GetMapping("/files/{filename:.+}")
	@ResponseBody
	public ResponseEntity<Resource> serveFile(@PathVariable String filename) {

		Resource file = storageService.loadAsResource(filename);
		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getFilename() + "\"")
				.body(file);
	}

	@PostMapping("/upload-file")
	public String handleFileUpload(@RequestParam(name = "file", required = false) MultipartFile file,
			@RequestParam("id") int id, @RequestParam("isCategory") String isCategory,
			@RequestParam(name = "name", required = false) String name, RedirectAttributes redirectAttributes,
			HttpSession session) throws Exception {

		if (session.getAttribute("user") == null)
			return "redirect:/login";
		if (file != null && !file.isEmpty()) {
			storageService.store(file);
			// google drive
			Drive service = getDriveService();
			if (name == null || name.isEmpty() || name.equals(""))
				name = file.getOriginalFilename();
			File fileMetadata = new File();
			String folderId = "1USj1sEvAAbHUiOPsvbuNYOD8bGpuiVjW";
			fileMetadata.setTitle(file.getOriginalFilename());
			ParentReference pf = new ParentReference();
			pf.setId(folderId);
			List<ParentReference> listPf = new ArrayList<ParentReference>();
			listPf.add(pf);
			fileMetadata.setParents(listPf);
			java.io.File filePath = new java.io.File(
					"src/main/resources/static/upload-dir/" + file.getOriginalFilename());
			FileContent mediaContent = new FileContent(file.getContentType(), filePath);
			File f = service.files().insert(fileMetadata, mediaContent).setFields("id").execute();
			filePath.delete();

			if (isCategory.equals("true")) {
				Category category = categoryService.FindOne(id);
				if (category != null) {
					if (category.getAttachment() == null)
						category.setAttachment("");
					String attachment = category.getAttachment() + "TITLEID" + name + "ID" + f.getId();
					category.setAttachment(attachment);
					categoryService.UpdateCategory(category);
				}
			} else if (isCategory.equals("false")) {
				News news = newsService.FindOne(id);
				if (news != null) {
					if (news.getLink() == null)
						news.setLink("");
					String attachment = news.getLink() + "TITLEID" + name + "ID" + f.getId();
					news.setLink(attachment);
					newsService.UpdateNews(news);
				}
			}
		}
		// System.out.println("File ID: " + f.getId()+" | "+f.getWebContentLink());
		// redirectAttributes.addFlashAttribute("message",
		// "You successfully uploaded " + file.getOriginalFilename() );
		// redirectAttributes.addFlashAttribute("embed","<iframe
		// src=\"https://drive.google.com/file/d/"+f.getId()+"/preview\" width=\"640\"
		// height=\"480\"></iframe>");
		// redirectAttributes.addFlashAttribute("linktai","https://drive.google.com/open?id="+f.getId());
		return "redirect:/Admin";
	}

	public static Credential authorize() throws Exception {
		// Load client secrets.
		InputStream in = FileUploadController.class.getResourceAsStream("/client_secret.json");
		GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));

		// Build flow and trigger user authorization request.
		GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(HTTP_TRANSPORT, JSON_FACTORY,
				clientSecrets, SCOPES).setDataStoreFactory(DATA_STORE_FACTORY).setAccessType("offline").build();
		Credential credential = new AuthorizationCodeInstalledApp(flow, new LocalServerReceiver()).authorize("user");
		System.out.println("Credentials saved to " + DATA_STORE_DIR.getAbsolutePath());
		return credential;
	}

	public static Drive getDriveService() throws Exception {
		Credential credential = authorize();
		return new Drive.Builder(HTTP_TRANSPORT, JSON_FACTORY, credential).setApplicationName(APPLICATION_NAME).build();
	}

	@ExceptionHandler(StorageFileNotFoundException.class)
	public ResponseEntity<Object> handleStorageFileNotFound(StorageFileNotFoundException exc) {
		return ResponseEntity.notFound().build();
	}

}

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.DocumentReference;
// [START fs_include_dependencies]
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.FirestoreOptions;
// [END fs_include_dependencies]
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;
import com.google.cloud.firestore.WriteResult;
import com.google.common.collect.ImmutableMap;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class DatabaseInteract {
	
	// Use the application default credentials
	GoogleCredentials credentials = GoogleCredentials.getApplicationDefault();
	FirebaseOptions options = new FirebaseOptions.Builder()
	    .setCredentials(credentials)
	    .setProjectId(projectId)
	    .build();
	FirebaseApp.initializeApp(options);

	Firestore db = FirestoreClient.getFirestore();
	
	public String getMsgId() {
		DocumentReference docRef = db.collection("message").document("msgid");
		
		ApiFuture<DocumentSnapshot> future = docRef.get();	
		DocumentSnapshot document = future.get();
		
		if (document.exists()) {
		  System.out.println("Document data: " + document.getData());
		  Map<String, Object> map = document.getData();
		  return map.get("msgid");
		} else {
		  System.out.println("No such document!");
		  return null;
		}
    }
	
	public void nextMsgId() {
		int msgid = Integer.parseInt(getMsgId()) + 1;
		
		// Create a Map to store the data we want to set
		Map<String, Object> docData = new HashMap<>();
		docData.put("msgid", msgid);
		
		// Add a new document (asynchronously) in collection "cities" with id "LA"
		ApiFuture<WriteResult> future = db.collection("message").document("msgid").set(docData);
		// ...
		// future.get() blocks on response
		System.out.println("Update time : " + future.get().getUpdateTime());
	}
	
	public void addUser(User user) {
		// Create a Map to store the data we want to set
			Map<String, Object> docData = new HashMap<>();
			docData.put("username", user.username);
			docData.put("password", user.password);
				
		// Add a new document (asynchronously) in collection "cities" with id "LA"
		ApiFuture<WriteResult> future = db.collection("user").document(username).set(docData);
	}
	
	public User queryUser(String username) {
		DocumentReference docRef = db.collection("user").document(username);
		// asynchronously retrieve the document
		ApiFuture<DocumentSnapshot> future = docRef.get();
		// block on response
		DocumentSnapshot document = future.get();
		User user = null;
		if (document.exists()) {
		  // convert document to POJO
		  user = document.toObject(User.class);
		  System.out.println(user);
		} else {
		  System.out.println("No such document!");
		}
		return user;
	}
	
	public void addMessage (Message msg) {
		// Create a Map to store the data we want to set
			Map<String, Object> docData = new HashMap<>();
			docData.put("id", getMsgId() + 1);
			docData.put("textMessage", msg.textMessage);
			docData.put("audioMessage", msg.audioMessage);
			docData.put("pictureMessage", msg.pictureMessage);
			docData.put("locationx", msg.locationx);
			docData.put("locationy", msg.locationy);
			docData.put("timestamp", msg.timestamp);
			docData.put("flaggedCount", 0);
			
			ApiFuture<WriteResult> future = db.collection("message").document((getMsgId()+1).toString()).set(docData);
			nextMsgId();
	}
	
	public Message queryMessage(int msgid) {
		DocumentReference docRef = db.collection("message").document(msgid.toString());
		// asynchronously retrieve the document
		ApiFuture<DocumentSnapshot> future = docRef.get();
		// block on response
		DocumentSnapshot document = future.get();
		Message msg = null;
		if (document.exists()) {
		  // convert document to POJO
		  msg = document.toObject(Message.class);
		  System.out.println(msg);
		} else {
		  System.out.println("No such document!");
		}
		return msg;
	}
	
	public void deleteMessage(int msgid) {
		// asynchronously delete a document
		ApiFuture<WriteResult> writeResult = db.collection("message").document(msgid.toString()).delete();
		// ...
		System.out.println("Update time : " + writeResult.get().getUpdateTime());
	}
	
	public ArrayList<User> getUser () {
		ArrayList<User> res = new ArrayList<User> ();
		//asynchronously retrieve all documents
		ApiFuture<QuerySnapshot> future = db.collection("user").get();
		// future.get() blocks on response
		List<QueryDocumentSnapshot> documents = future.get().getDocuments();
		for (QueryDocumentSnapshot document : documents) {
			res.push(document.toObject(User.class));
		}
		return res;
	}
	
	public ArrayList<Message> getMessage () {
		ArrayList<Message> res = new ArrayList<Message> ();
		//asynchronously retrieve all documents
		ApiFuture<QuerySnapshot> future = db.collection("message").get();
		// future.get() blocks on response
		List<QueryDocumentSnapshot> documents = future.get().getDocuments();
		for (QueryDocumentSnapshot document : documents) {
			res.push(document.toObject(Message.class));
		}
		return res;
	}
}

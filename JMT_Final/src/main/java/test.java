
public class test {
	public static void main(String[] args) {
		 String path = test.class.getResource("").getPath();
		 System.out.println(path);
		 System.out.println(System.getProperty("user.dir"));
	}

}

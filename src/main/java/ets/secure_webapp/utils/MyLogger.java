package ets.secure_webapp.utils;

import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

public class MyLogger {

	private Logger logger;
	private static final boolean IS_WINDOWS = System.getProperty("os.name").contains("indow");

	public MyLogger(String className) {
		this.logger = Logger.getLogger(className);
	}

	public void log(Level level, String msg) {
		// Initialize logger
		try {
			// This block configure the logger with handler and formatter
			ClassLoader classLoader = getClass().getClassLoader();
			String filePath = classLoader.getResource("ServerLog.log").getFile();

			String osAppropriatePath = IS_WINDOWS
					? filePath = "C:/Users/ANTOINE/Git/secure_webapp/src/main/resources/ServerLog.log" : filePath;
			FileHandler fh = new FileHandler(osAppropriatePath, 16184, 1, true);
			this.logger.addHandler(fh);
			this.logger.setLevel(Level.ALL);

			// Write the log the message
			this.logger.log(level, msg);

			SimpleFormatter formatter = new SimpleFormatter();
			fh.setFormatter(formatter);

			// Close the file
			fh.flush();
			fh.close();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

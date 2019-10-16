package com.skynet.infrastructure;

import org.springframework.util.ResourceUtils;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
<<<<<<< HEAD
=======
import java.util.Collections;
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
import java.util.List;

public class FileSensitiveWordsProvider implements SensitiveWordsProvider {

    private String filePath;

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    @Override
    public List<String> provide() throws Exception {
<<<<<<< HEAD
        File file = ResourceUtils.getFile(filePath);
        return Files.readAllLines(Paths.get(file.toURI()));
=======
//        File file = ResourceUtils.getFile(filePath);
//        return Files.readAllLines(Paths.get(file.toURI()));
        return Collections.EMPTY_LIST;
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
    }
}

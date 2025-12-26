/*
 * Copyright 2013 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package ru.betelgeuse.dunpixpar;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.view.WindowManager;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import android.app.Activity;
import android.content.SharedPreferences;
import android.content.res.AssetManager;
import android.os.Bundle;
import android.util.Log;

import java.io.File;

public class JNIActivity extends Activity {
    private static String TAG = "JNIActivity";
    private static String RESOURCES_DIR = "lisp";
    private static String APP_RESOURCES_DIR = "resources";

    JNIView mView;
    static AssetManager sAssetManager;
    static File sUncompressedFilesDir;
    static JNIActivity sInstance;

    public static JNIActivity getInstance() {
        return sInstance;
    }

    @Override protected void onCreate(Bundle icicle) {
        super.onCreate(icicle);
	
        sInstance = this;
        sAssetManager = getAssets();

	// Uncompress assets

        SharedPreferences settings = getPreferences(MODE_PRIVATE);
        boolean assetsUncompressed = settings.getBoolean("assetsUncompressed", false);
        sUncompressedFilesDir = getDir(APP_RESOURCES_DIR,MODE_PRIVATE);

        // if(!assetsUncompressed)
        {
            uncompressDir(RESOURCES_DIR, sUncompressedFilesDir);
            SharedPreferences.Editor editor = settings.edit();
            editor.putBoolean("assetsUncompressed", true);
            editor.commit();
        }

        mView = new JNIView(getApplication());
        setContentView(mView);
    }

    public void uncompressDir(String in, File out) {
        try {
	    String[] files = sAssetManager.list(in);
	    Log.w(TAG,"Uncompressing: " + files.length + " files");
	    for(int i=0; i<files.length; i++) {
		Log.w(TAG,"Uncompressing: " + files[i]);
		File fileIn = new File(in,files[i]);
		File fileOut = new File(out,files[i]);

		try {
		    uncompressFile(fileIn,fileOut);
		}
		catch(FileNotFoundException e) {
		    // fileIn is a directory, uncompress the subdir
		    if(!fileOut.isDirectory())
			{
			    Log.w(TAG,"Creating dir: " + fileOut.getAbsolutePath());
			    fileOut.mkdir();
			}
		    uncompressDir(fileIn.getPath(), fileOut);
		}
	    }
	}
        catch(IOException e) {
	    e.printStackTrace();
	}
    }

    public static String getResourcesPath() {
        return sUncompressedFilesDir.getAbsolutePath();
    }

    public static void uncompressFile(File fileIn,File fileOut)
	throws IOException {
        InputStream in = sAssetManager.open(fileIn.getPath(), android.content.res.AssetManager.ACCESS_RANDOM);
        OutputStream out = new FileOutputStream(fileOut);

        byte[] buf = new byte[1024];
        int len;
        while ((len = in.read(buf)) > 0) {
	    out.write(buf, 0, len);
	}

        in.close();
        out.close();
        Log.i(TAG,"File copied.");
    }

    @Override protected void onPause() {
        super.onPause();
        mView.onPause();
    }

    @Override protected void onResume() {
        super.onResume();
        mView.onResume();
    }
}

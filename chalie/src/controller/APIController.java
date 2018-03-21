package controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Service.DBAddService;

@Controller
@RequestMapping("/DB")
public class APIController {

	@Autowired
	DBAddService DBAddService;

	@SuppressWarnings("rawtypes")
	@RequestMapping("/API")
	public void APICall(@RequestParam("start_page") int start_page, @RequestParam("end_page") int end_page,
			@RequestParam("size") int size) throws IOException{
		// DB 호출 (시작페이지, 끝페이지, 페이지 크기)
		// start_page = 1;
		// end_page = 1;
		// size = 100;
		// ==========================================================

		for (int p = start_page; p <= end_page; p++) {
			String cert_key = "4be90fba6a53be5ac5c96397567a2002";
			String result_style = "json";
			int page_no = p;
			int page_size = size;
			// 파라미터
			String params = "cert_key=" + cert_key + "&result_style=" + result_style + "&page_no="
					+ Integer.toString(page_no) + "&page_size=" + Integer.toString(page_size);

			byte[] postData = params.getBytes(StandardCharsets.UTF_8);
			int postDataLength = postData.length;

			URL url = new URL("http://seoji.nl.go.kr/landingPage/SearchApi.do");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setInstanceFollowRedirects(false);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			conn.setRequestProperty("Host", "seoji.nl.go.kr");
			conn.setRequestProperty("charset", "utf-8");
			conn.setRequestProperty("Content-Length", Integer.toString(postDataLength));
			conn.setUseCaches(false);

			conn.setDoOutput(true);
			conn.setConnectTimeout(20000);
			conn.setReadTimeout(20000);

			conn.connect();

			try (DataOutputStream wr = new DataOutputStream(conn.getOutputStream())) {
				wr.write(postData);
			}

			InputStream is = conn.getInputStream();
			String jsonText = "";
			try {
				BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
				StringBuilder sb = new StringBuilder();
				int i;
				while ((i = rd.read()) != -1) {
					sb.append((char) i);
				}
				jsonText = sb.toString();
				System.out.println(jsonText);
			} finally {
				is.close();
			}
			try {
				JSONObject json = new JSONObject(jsonText);
				if (jsonText.indexOf("ERR_MESSAGE") == 2) {
					System.out.println("ERR_MESSAGE : " + json.get("ERR_MESSAGE"));
					System.out.println("ERR_CODE : " + json.get("ERR_CODE"));
					System.out.println("RESULT : " + json.get("RESULT"));
				} else {
					JSONArray array = (JSONArray) json.get("docs");
					for (int i = 1; i <= array.length(); i++) {
						JSONObject obj = (JSONObject) array.get(i - 1);
						Map<String, Object> map = new HashMap<String, Object>();
						System.out.println("============================");
						System.out.println("NO : " + (i + ((p - 1) * 100)));
						System.out.println("SUBJECT : " + obj.get("SUBJECT"));
						System.out.println("AUTHOR : " + obj.get("AUTHOR"));
						System.out.println("EA_ISBN : " + obj.get("EA_ISBN"));
						System.out.println("PUBLISHER : " + obj.get("PUBLISHER"));
						System.out.println("SERIES_NO : " + obj.get("SERIES_NO"));
						System.out.println("PUBLISH_PREDATE : " + obj.get("PUBLISH_PREDATE"));
						System.out.println("FORM_DETAIL : " + obj.get("FORM_DETAIL"));
						System.out.println("SERIES_TITLE : " + obj.get("SERIES_TITLE"));
						System.out.println("PRE_PRICE : " + obj.get("PRE_PRICE"));
						System.out.println("TITLE : " + obj.get("TITLE"));
						System.out.println("============================");
						map.put("NO", (i + ((p - 1) * 100)));
						map.put("SUBJECT", obj.get("SUBJECT"));
						map.put("AUTHOR", obj.get("AUTHOR"));
						map.put("EA_ISBN", obj.get("EA_ISBN"));
						map.put("PUBLISHER", obj.get("PUBLISHER"));
						map.put("SERIES_NO", obj.get("SERIES_NO"));
						map.put("PUBLISH_PREDATE", obj.get("PUBLISH_PREDATE"));
						map.put("FORM_DETAIL", obj.get("FORM_DETAIL"));
						map.put("SERIES_TITLE", obj.get("SERIES_TITLE"));
						map.put("PRE_PRICE", obj.get("PRE_PRICE"));
						map.put("TITLE", obj.get("TITLE"));
						boolean b = DBAddService.add(map);
						if (!b) {
							Thread.sleep(60000);
						} else {
							System.out.println("!!! NO " + (i + ((p - 1) * 100)) + " INSERTED !!!");
						}
						map.clear();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}

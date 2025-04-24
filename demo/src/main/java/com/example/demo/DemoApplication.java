package com.example.demo;


import java.util.*;


public class DemoApplication {

	public static void main(String[] args) {


		Example e = new Example();
		e.accessKey = "7389afda75484c10af3980e15b8fd13d";
		e.secretKey = "9802d315d1654a2cb97a5595fb8d09b3";

		Map<String, Object> query = new HashMap<>();
		//query.put("serviceType", "dns");

		String uri = e.doSignature("/api/vaso/auth/token", "post", query);
//		String uri = e.doSignature("/api/v2/netcenter/vpc", "get", new HashMap<>());
//		String uri = e.doSignature("/api/v2/netcenter/vpc", "get", new HashMap<>());
//		String uri = e.doSignature("/api/v2/netcenter/vpc", "get", new HashMap<>());
		String hp = String.format("http://%s:%d", "10.253.26.218", 18080);
		String result = e.doGet(hp + uri);
		System.out.println(result);
	}

}

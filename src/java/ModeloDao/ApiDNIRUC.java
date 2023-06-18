/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDao;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import Modelo.ApiReniecSunat;
import java.io.IOException;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 *
 * @author Claudio Cruzado
 */
public class ApiDNIRUC {
     public ApiReniecSunat ConsultarRUC(String BuscarRuc){
        ApiReniecSunat apiruc = null;
            try {
                URL url = new URL("https://dniruc.apisperu.com/api/v1/ruc/"
                    + BuscarRuc+"?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9."
                    + "eyJlbWFpbCI6ImNsYXVkaW9wYXVsY2VAZ21haWwuY29tIn0."
                    + "PA6Q3gqMNlYU3hj6HaBmaMdrQlwKwtczLtSrp7ZySRg");
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");
                conn.connect();
            
                int respodeCode = conn.getResponseCode();
                if(respodeCode != 200){

                }else{
                    StringBuilder informationString = new StringBuilder();
                    try (Scanner scanner = new Scanner(url.openStream())) {
                        while(scanner.hasNext()){
                            informationString.append(scanner.nextLine());
                        }
                    }
                    JSONParser parse = new JSONParser();
                    Object obj = parse.parse(String.valueOf(informationString));

                    JSONObject datos = (JSONObject) obj;

                    apiruc = new ApiReniecSunat();
                    apiruc.setRuc((String)datos.get("ruc"));
                    apiruc.setRasonsocial((String) datos.get("razonSocial"));
                    apiruc.setDireccion((String) datos.get("direccion"));
                }
            } catch (IOException | ParseException es) {
                es.getMessage();
            }
            return apiruc;
    }
    
}

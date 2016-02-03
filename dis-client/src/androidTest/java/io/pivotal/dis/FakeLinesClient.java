package io.pivotal.dis;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

import io.pivotal.dis.lines.LinesClient;
import io.pivotal.dis.lines.Line;

public class FakeLinesClient implements LinesClient {
  private List<Line> lines;

  FakeLinesClient(List<Line> lines) {
    this.lines = lines;
  }

  @Override
  public JSONObject fetchDisruptedLines() throws JSONException {
    JSONObject root = new JSONObject();
    JSONArray disruptions = new JSONArray();
    
    for (Line line : lines) {
      if (line.getStartTime() != null) {
        disruptions.put(new JSONObject("{ \"line\": \"" + line.getName() + "\", " +
                "\"status\": \"" + line.getStatus() + "\", " +
                "\"startTime\": \"" + line.getStartTime() + "\"," +
                "\"endTime\": \"" + line.getEndTime() + "\"" +
                "}"));
      } else {
        disruptions.put(new JSONObject("{ \"line\": \"" + line.getName() + "\", \"status\": \"" + line.getStatus() + "\" }"));
      }
    }

    root.put("disruptions", disruptions);
    return root;
  }

  public void setDisruptedLines(List<Line> lines) {
    this.lines = lines;
  }
}

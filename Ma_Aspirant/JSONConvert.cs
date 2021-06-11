using System;
using System.Collections.Generic;
using System.Text;


namespace RecruitmentJSON
{
    static class JSONConvert
    {
        public static string encode(Dictionary<string, string> parameters)
        {

            StringBuilder jsonString = new StringBuilder();
            if (parameters.Count > 0)
            {

                int totalValues = parameters.Count;
                jsonString.Append("{");
                int counter = 1;

                foreach (string key in parameters.Keys)
                {

                    if (parameters[key].Trim().Contains("{") && parameters[key].Trim().Contains("}"))
                    {
                        if (counter < totalValues)
                        {
                            jsonString.Append("\"" + key + "\":" + parameters[key] + ",");
                        }
                        else
                        {
                            jsonString.Append("\"" + key + "\":" + parameters[key] + "");
                        }
                    }
                    else
                    {
                        if (counter < totalValues)
                        {
                            jsonString.Append("\"" + key + "\":\"" + parameters[key] + "\",");
                        }
                        else
                        {
                            jsonString.Append("\"" + key + "\":\"" + parameters[key] + "\"");
                        }
                    }
                    counter++;
                }

                jsonString.Append("}");
            }
            return jsonString.ToString();
        }
        public static Dictionary<string, string> decode(string json)
        {
            json = json.Replace("null,", @""""",").Replace("null}", @"""""}").Replace("\"response\":{", "");
            Dictionary<string, string> encodedJson = new Dictionary<string, string>();
            json = json.Trim();
            string strart = json.Substring(0, 1);
            string end = json.Substring(json.Length - 1, 1);
            //MessageBox.Show (json);
            if (json.Substring(0, 1) == "{" && json.Substring(json.Length - 1, 1) == "}")
            {
                //MessageBox.Show (json);
                int keyStart = 0;
                int keyEnd = 0;
                int valueStart = 0;
                int valueEnd = 0;
                int separatorPos = 0;
                string key, value;
                do
                {
                    key = "";
                    value = "";
                    keyStart = json.IndexOf('"', keyStart);
                    //keyEnd = json.IndexOf('"', keyStart + 1);
                    keyEnd = keyPos(json, keyStart + 1);

                    valueStart = json.IndexOf(':', keyEnd);
                    valueStart = json.IndexOf('"', valueStart);
                    valueEnd = keyPos(json, valueStart + 1);

                    separatorPos = json.IndexOf(',', valueEnd);

                    key = json.Substring(keyStart + 1, keyEnd - keyStart - 1);
                    value = json.Substring(valueStart + 1, valueEnd - valueStart - 1);
                    if (key.Length > 0)
                    {
                        encodedJson.Add(key, value);
                    }
                    keyStart = separatorPos;
                } while (keyEnd < json.Length && keyStart != -1 && valueStart != -1);
            }
            else
            {

            }
            return encodedJson;
        }

        private static int keyPos(string json, int start)
        {
            int pos = -1;
            bool found = false;
            do
            {
                pos = json.IndexOf('"', start);
                if (json.Substring(pos - 1, 2) != "\\\"")
                {
                    found = true;
                }
                else
                {
                    start = pos + 1;
                }

            } while (pos != -1 && found == false);
            return pos;
        }
    }
}

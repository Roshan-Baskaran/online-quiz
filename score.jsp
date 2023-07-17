<%@ page import="java.io.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>QUIZ LEADERBOARD</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster">
			<style>
	  body {
	    font-family: Arial, sans-serif;
	    background-color: #f2f2f2;
	    background-image: url('back.jpg');
	    background-repeat: no-repeat;
	    background-attachment: fixed;
	    background-size: cover;
	  }

	  h1 {
	    text-align: center;
	    color: #555;
	  }

	  table {
	    margin: auto;
	    border-collapse: collapse;
	    border-spacing: 0;
	    width: 80%;
	    border: 3px solid #FF0000;
	    background-color: #fff;
	    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	  }

	  th, td {
	    text-align: left;
	    padding: 16px;
	    border-bottom: 1px solid #ddd;
	    color: #333;
	  }

	  th {
	    background-color: #FFC107;
	    color: white;
	  }

	  tr:hover {
	    background-color: #f5f5f5;
	  }

	  .odd {
	    background-color: #f2f2f2;
	  }

	  .even {
	    background-color: #e6e6e6;
	  }

	</style>


</head>
<body>
    <h1>LEADERBOARD</h1>
    <%
        // Read data from text file
        String filePath = "C:/Users/ROSHAN/Downloads/apache-tomcat-10.1.7-windows-x64/apache-tomcat-10.1.7/webapps/ROOT/quiz_scores.txt";
        File file = new File(filePath);
        Scanner scanner = new Scanner(file);
        // Collect scores into a list
        List<String[]> scores = new ArrayList<>();
        while (scanner.hasNextLine()) {
            String line = scanner.nextLine();
            String[] score = line.split(",");
            scores.add(score);
        }
        // Sort scores by descending order of score
        scores.sort(new Comparator<String[]>() {
            @Override
            public int compare(String[] a, String[] b) {
                return Integer.compare(Integer.parseInt(b[1]), Integer.parseInt(a[1]));
            }
        });
        scanner.close();
    %>
    <table>
        <tr>
            <th>Rank</th>
            <th>Name</th>
            <th>Score</th>
        </tr>
        <%
            // Loop through each score and display leaderboard
            int rank = 1;
            for (String[] score : scores) {
        %>
        <tr>
            <td><%= rank %></td>
            <td><%= score[0] %></td>
            <td><%= score[1] %></td>
        </tr>
        <%
                rank++;
            }
        %>
    </table>
</body>
</html>

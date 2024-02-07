package servlets;

import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Tasks;

import java.io.IOException;
@WebServlet(value = "/addTasks")
public class AddServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String deadlineDate = req.getParameter("deadlineDate");
        boolean status = Boolean.parseBoolean(req.getParameter("status"));
        Tasks tasks = new Tasks();
        tasks.setId(tasks.getId());
        tasks.setName(name);
        tasks.setDescription(description);
        tasks.setDeadlineDate(deadlineDate);
        tasks.setStatus(status);
        DBManager.addTasks(tasks);
        resp.sendRedirect("home.jsp");

    }
}


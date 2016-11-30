package xupt.se.ttms.idao;

import xupt.se.ttms.dao.EmployeeDAO;

public class DAOFactory
{
    public static IEmployee creatEmployeeDAO()
    {
        return new EmployeeDAO();
    }
}

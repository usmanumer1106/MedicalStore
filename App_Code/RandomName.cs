using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RandomName
/// </summary>
public class RandomName
{
    public RandomName()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static string GetRandomName(int length)
    {
        char[] chars = "abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray();
        string name = string.Empty;
        Random random = new Random();

        for (int i = 0; i < length; i++)
        {
            int x = random.Next(1, chars.Length);
            //For avoiding Repetation of Characters
            if (!name.Contains(chars.GetValue(x).ToString()))
                name += chars.GetValue(x);
            else
                i = i - 1;
        }
        return name;
    }
}
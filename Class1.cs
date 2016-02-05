using System;
using System.Collections.Generic;
//using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;

    public static partial class UserDefinedFunctions
    {
        public static readonly RegexOptions Options =
            RegexOptions.IgnorePatternWhitespace |
            RegexOptions.Singleline |
            RegexOptions.IgnoreCase;

        [SqlFunction]
        public static SqlBoolean RegexMatch(
            SqlChars input, SqlString pattern)
        {
            if (input == null || pattern == null || input.IsNull || pattern.IsNull)
                return false;

            try
            {
                Regex regex = new Regex(pattern.Value, Options);
                return regex.IsMatch(new string(input.Value));
            }
            catch (ArgumentException aEx)
            {
                return false;
            }
            //catch (ArgumentOutOfRangeException aEx)
            //{
            //    return false;
            //}

            return false;
        }
    }

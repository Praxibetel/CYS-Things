using System.Security.Cryptography;
using System.Text;

string GenerateSalt()
{
    byte[] saltBytes = new byte[16];
    using (var rng = new RNGCryptoServiceProvider())
    {
        rng.GetBytes(saltBytes);
    }
    return Convert.ToBase64String(saltBytes);
}

string HashPassword(string password, string salt)
{
    using (var rfc2898 = new Rfc2898DeriveBytes(password, Encoding.UTF8.GetBytes(salt), 10000))
    {
        return Convert.ToBase64String(rfc2898.GetBytes(256));
    }
}

void UpdatePasswords()
{
    var users = GetUsers();
    foreach (var user in users)
    {
        string salt = GenerateSalt();
        string hashedPassword = HashPassword(user.Password, salt);
        
        UpdateUserPassword(user.UserID, hashedPassword, salt);
    }
}

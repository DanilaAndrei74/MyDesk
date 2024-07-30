using System.Security.Cryptography;
using System.Text;

namespace Shared.Services
{
    public class CryptographyService
    {
        public string CreateSalt()
        {
            return Guid.NewGuid().ToString();
        }

        public Byte[] HashPassword(string password, string salt)
        {
            if (password == null || salt == null) return null;

            byte[] saltAndPwdBytes = Encoding.UTF8.GetBytes(password + salt);
            byte[] hashBytes;

            using (SHA256 algorithm = SHA256.Create())
            {
                hashBytes = algorithm.ComputeHash(saltAndPwdBytes);
            }

            return hashBytes;
        }

        public bool ValidatePassword(byte[] array1, byte[] array2)
        {
            return array1.Length == array2.Length && !array1.Where((t, i) => t != array2[i]).Any();
        }
    }
}

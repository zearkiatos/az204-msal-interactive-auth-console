using dotenv.net;

namespace Configuration
{
    public static class AppConfiguration
    {
        private static IDictionary<string, string> envVars = null;
        static AppConfiguration()
        {
            DotEnv.Load();
            envVars = DotEnv.Read();
        }

        public static string ClientId => 
            envVars["CLIENT_ID"] 
            ?? throw new InvalidOperationException("CLIENT_ID environment variable is not set");

        public static string TenantId => 
            envVars["TENANT_ID"] 
            ?? throw new InvalidOperationException("TENANT_ID environment variable is not set");

        public static void ValidateConfiguration()
        {
            try
            {
                _ = ClientId;
                _ = TenantId;
                Console.WriteLine("✓ Configuration validation passed");
            }
            catch (InvalidOperationException ex)
            {
                Console.WriteLine($"✗ Configuration validation failed: {ex.Message}");
                throw;
            }
        }
    }
}
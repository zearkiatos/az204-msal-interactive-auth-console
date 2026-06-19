using System;
using Configuration;
using Microsoft.Identity.Client;

class Program
{
    async static Task Main(string[] args)
    {
        AppConfiguration.ValidateConfiguration();
        string clientId = AppConfiguration.ClientId;
        string tenantId = AppConfiguration.TenantId;

        string[] _scopes = { "User.Read" };

        var app = PublicClientApplicationBuilder.Create(clientId)
            .WithAuthority(AzureCloudInstance.AzurePublic, tenantId)
            .WithDefaultRedirectUri()
            .Build();

        AuthenticationResult result;
        try
        {
            var accounts = await app.GetAccountsAsync();
            result = await app.AcquireTokenSilent(_scopes, accounts.FirstOrDefault())
                        .ExecuteAsync();
        }
        catch (MsalUiRequiredException)
        {
            result = await app.AcquireTokenInteractive(_scopes)
            .ExecuteAsync();
        }

        Console.WriteLine($"Access Token:\n{result.AccessToken}");
    }

}
using MyDesk.Frontend.Models;
using System.Reflection.Metadata;
using System;
using Microsoft.AspNetCore.Components.Server.ProtectedBrowserStorage;
using System.Xml.Linq;

namespace MyDesk.Frontend.Services
{
    public interface IAccountService
    {
        UserLocal User { get; }
        Task Get();
        Task Set(UserLocal userInput);
        Task SetUri(string uri);
        Task Delete();
    }
    public class AccountService : IAccountService
    {
    private ProtectedLocalStorage _storage;
    public AccountService(ProtectedLocalStorage localStorageService) 
    {
        _storage = localStorageService;
    }


    public UserLocal User { get; private set; }
    public string userString = "_user";

    public async Task Get()
    {
		var result = await _storage.GetAsync<UserLocal>(userString);
		User = result.Success ? result.Value! : null;
    }
    public async Task Set(UserLocal userInput)
    {
        await _storage.SetAsync(userString, userInput);
        User = userInput;
    }

    public async Task SetUri(string uri)
    {
        User.lastZoneUri = uri;
        await _storage.SetAsync(userString, User);
    }

    public async Task Delete()
    {
        await _storage.DeleteAsync(userString);
    }

    }
}

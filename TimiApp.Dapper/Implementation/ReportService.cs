﻿using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Linq;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Threading.Tasks;
using TimiApp.Dapper.Interfaces;
using TimiApp.Dapper.ViewModels;

namespace TimiApp.Dapper.Implementation
{
    public class ReportService : IReportService
    {
        private readonly IConfiguration _configuration;
        public ReportService(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<IEnumerable<BestSellerOfCategoryViewModel>> GetBestSellerOfCategory()
        {
            using (var sqlConnection = new SqlConnection(_configuration.GetConnectionString("OnlineStoreContextConnection")))
            {
                await sqlConnection.OpenAsync();
                try
                {
                    return await sqlConnection.QueryAsync<BestSellerOfCategoryViewModel>("GetBestSellerOfCategory", commandType: CommandType.StoredProcedure);
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }

        public async Task<IEnumerable<RevenueReportViewModel>> GetRevenueReportAsync(string fromDate, string toDate)
        {
            using (var sqlConnection = new SqlConnection(_configuration.GetConnectionString("OnlineStoreContextConnection")))
            {
                await sqlConnection.OpenAsync();
                var dynamicParameters = new DynamicParameters();
                var now = DateTime.Now;
                
                var firstDayOfMonth = new DateTime(now.Year, now.Month, 1);
                var lastDayOfMonth = firstDayOfMonth.AddMonths(1).AddDays(-1);

                fromDate = !string.IsNullOrEmpty(fromDate) == true ? DateTime.ParseExact(fromDate, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) : firstDayOfMonth.ToString("MM/dd/yyyy");
                toDate = !string.IsNullOrEmpty(toDate) == true ? DateTime.ParseExact(toDate, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) : lastDayOfMonth.ToString("MM/dd/yyyy");

                dynamicParameters.Add("@fromDate", fromDate);
                dynamicParameters.Add("@toDate", toDate);

                try
                {
                    return await sqlConnection.QueryAsync<RevenueReportViewModel>(
                        "GetRevenueDaily", dynamicParameters, commandType: CommandType.StoredProcedure);
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }

        public async Task<IEnumerable<MostDeliveryMethodViewModel>> GetTopMostOfCategoryAsync()
        {
            using (var sqlConnection = new SqlConnection(_configuration.GetConnectionString("OnlineStoreContextConnection")))
            {
                await sqlConnection.OpenAsync();
                try
                {
                    IEnumerable<MostDeliveryMethodViewModel> a = await sqlConnection.QueryAsync<MostDeliveryMethodViewModel>("GetBestDeliveryMethod", commandType: CommandType.StoredProcedure);
                    return await sqlConnection.QueryAsync<MostDeliveryMethodViewModel>("GetBestDeliveryMethod", commandType: CommandType.StoredProcedure);
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using API_Til_IOT.Database;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Swashbuckle.AspNetCore.Swagger;
using Pomelo.EntityFrameworkCore.MySql;
using Pomelo.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;
using API_Til_IOT.Controllers;
using Microsoft.EntityFrameworkCore.Infrastructure;

namespace API_Til_IOT
{
    //CORS
    //https://stackoverflow.com/questions/36002493/no-access-control-allow-origin-header-in-angular-2-app
    //https://stackoverflow.com/questions/44379560/how-to-enable-cors-in-asp-net-core-webapi
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<LoginDBContext>(options =>
            options
            .UseMySql(Configuration["ConnectionStrings:DefaultConnection"])
            );

            services.AddIdentity<IdentityUser, IdentityRole>()
                .AddEntityFrameworkStores<LoginDBContext>()
                .AddDefaultTokenProviders();

            services.AddCors();

            /*
             * validate the server that created that token (ValidateIssuer = true);
                ensure that the recipient of the token is authorized to receive it (ValidateAudience = true);
                check that the token is not expired and that the signing key of the issuer is valid (ValidateLifetime = true);
                verify that the key used to sign the incoming token is part of a list of trusted keys (ValidateIssuerSigningKey = true).
             * */
            services
                .AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                .AddJwtBearer(options =>
                {
                    options.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuer = true,
                        ValidateAudience = true,
                        ValidateLifetime = true,
                        ValidateIssuerSigningKey = true,
                        // reference to appsettings.json
                        ValidIssuer = Configuration["Jwt:Issuer"],
                        ValidAudience = Configuration["Jwt:Audience"],
                        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration["Jwt:SecretKey"]))//Configuration["Jwt:Key"]
                    };
                });

            services.AddMvc();
            services.AddScoped<JWTTokenController>();
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new Info { Title = "Login and Registration system", Version = "v1" });
            });
        }

 
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            app.UseCors(
options => options
    .AllowAnyOrigin()
    .AllowAnyMethod()
    .AllowAnyHeader()
    .AllowCredentials()

);

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

         
            app.UseAuthentication();

            app.UseSwagger();

           
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Museum Thy Library V1");

            });

            app.UseMvc();

        }
    }
}

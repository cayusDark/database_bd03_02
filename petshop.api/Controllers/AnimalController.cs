using Microsoft.AspNetCore.Mvc;
using petshop.api.services;
using petshop.api.model;
using System.Threading.Tasks;
using System;


namespace petshop.api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

    public class AnimalController : Controller
    {
        public readonly MongoDbService _mongoDBService;

        public AnimalController(){
            _mongoDBService = new MongoDbService("AnimalController","Animal","mongodb://localhost:27017");
        }

        [HttpPost]

        public async Task Cadastrar([FromBody] Animal animal){
            await _mongoDBService.Insere(animal);

        }

         [HttpGet]
         public async Task<JsonResult> PegarTodosAnimais(){
             var todosAnimais=await _mongoDBService.GetAllAnimals();
             return Json(todosAnimais);
         }



    }
}
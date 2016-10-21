using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CIRApresentacao.Models;

namespace CIRApresentacao.Controllers
{
    public class AnunciosController : Controller
    {
        private CIRDataEntities db = new CIRDataEntities();

        // GET: Anuncios
        public ActionResult Index()
        {
            var anuncios = db.anuncios.Include(a => a.categoria).Include(a => a.usuario);
            return View(anuncios.ToList());
        }

        // GET: Anuncios/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            anuncio anuncio = db.anuncios.Find(id);
            if (anuncio == null)
            {
                return HttpNotFound();
            }
            return View(anuncio);
        }

        // GET: Anuncios/Create
        public ActionResult Create()
        {
            ViewBag.Categoria_Produto_id = new SelectList(db.categorias, "Categoria_Produto_id", "Descricao");
            ViewBag.Usuario_id = new SelectList(db.usuarios, "Usuario_id", "Nome");
            return View();
        }

        // POST: Anuncios/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Anuncio_id,Usuario_id,Data,Descricao,Tipo_Categoria,Imagem,Categoria_Produto_id")] anuncio anuncio)
        {
            if (ModelState.IsValid)
            {
                db.anuncios.Add(anuncio);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Categoria_Produto_id = new SelectList(db.categorias, "Categoria_Produto_id", "Descricao", anuncio.Categoria_Produto_id);
            ViewBag.Usuario_id = new SelectList(db.usuarios, "Usuario_id", "Nome", anuncio.Usuario_id);
            return View(anuncio);
        }

        // GET: Anuncios/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            anuncio anuncio = db.anuncios.Find(id);
            if (anuncio == null)
            {
                return HttpNotFound();
            }
            ViewBag.Categoria_Produto_id = new SelectList(db.categorias, "Categoria_Produto_id", "Descricao", anuncio.Categoria_Produto_id);
            ViewBag.Usuario_id = new SelectList(db.usuarios, "Usuario_id", "Nome", anuncio.Usuario_id);
            return View(anuncio);
        }

        // POST: Anuncios/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Anuncio_id,Usuario_id,Data,Descricao,Tipo_Categoria,Imagem,Categoria_Produto_id")] anuncio anuncio)
        {
            if (ModelState.IsValid)
            {
                db.Entry(anuncio).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Categoria_Produto_id = new SelectList(db.categorias, "Categoria_Produto_id", "Descricao", anuncio.Categoria_Produto_id);
            ViewBag.Usuario_id = new SelectList(db.usuarios, "Usuario_id", "Nome", anuncio.Usuario_id);
            return View(anuncio);
        }

        // GET: Anuncios/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            anuncio anuncio = db.anuncios.Find(id);
            if (anuncio == null)
            {
                return HttpNotFound();
            }
            return View(anuncio);
        }

        // POST: Anuncios/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            anuncio anuncio = db.anuncios.Find(id);
            db.anuncios.Remove(anuncio);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

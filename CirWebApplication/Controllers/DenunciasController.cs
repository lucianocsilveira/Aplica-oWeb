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
    public class DenunciasController : Controller
    {
        private CIRDataEntities db = new CIRDataEntities();

        // GET: Dnuncias
        public ActionResult Index()
        {
            var denuncias = db.denuncias.Include(d => d.anuncio).Include(d => d.usuario);
            return View(denuncias.ToList());
        }

        // GET: Dnuncias/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            denuncia denuncia = db.denuncias.Find(id);
            if (denuncia == null)
            {
                return HttpNotFound();
            }
            return View(denuncia);
        }

        // GET: Dnuncias/Create
        public ActionResult Create()
        {
            ViewBag.Anuncio_id = new SelectList(db.anuncios, "Anuncio_id", "Descricao");
            ViewBag.Usuario_id = new SelectList(db.usuarios, "Usuario_id", "Nome");
            return View();
        }

        // POST: Dnuncias/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Denuncia_id,Anuncio_id,Descricao,Data,Usuario_id")] denuncia denuncia)
        {
            if (ModelState.IsValid)
            {
                db.denuncias.Add(denuncia);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Anuncio_id = new SelectList(db.anuncios, "Anuncio_id", "Descricao", denuncia.Anuncio_id);
            ViewBag.Usuario_id = new SelectList(db.usuarios, "Usuario_id", "Nome", denuncia.Usuario_id);
            return View(denuncia);
        }

        // GET: Dnuncias/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            denuncia denuncia = db.denuncias.Find(id);
            if (denuncia == null)
            {
                return HttpNotFound();
            }
            ViewBag.Anuncio_id = new SelectList(db.anuncios, "Anuncio_id", "Descricao", denuncia.Anuncio_id);
            ViewBag.Usuario_id = new SelectList(db.usuarios, "Usuario_id", "Nome", denuncia.Usuario_id);
            return View(denuncia);
        }

        // POST: Dnuncias/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Denuncia_id,Anuncio_id,Descricao,Data,Usuario_id")] denuncia denuncia)
        {
            if (ModelState.IsValid)
            {
                db.Entry(denuncia).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Anuncio_id = new SelectList(db.anuncios, "Anuncio_id", "Descricao", denuncia.Anuncio_id);
            ViewBag.Usuario_id = new SelectList(db.usuarios, "Usuario_id", "Nome", denuncia.Usuario_id);
            return View(denuncia);
        }

        // GET: Dnuncias/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            denuncia denuncia = db.denuncias.Find(id);
            if (denuncia == null)
            {
                return HttpNotFound();
            }
            return View(denuncia);
        }

        // POST: Dnuncias/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            denuncia denuncia = db.denuncias.Find(id);
            db.denuncias.Remove(denuncia);
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

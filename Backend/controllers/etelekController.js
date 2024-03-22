const {PrismaClient} = require("@prisma/client")
const prisma = new PrismaClient();


const modositas = async (req, res) => {
    const id = req.params.etelid;
    const {ar, kategoria, leiras, nev} = req.body;

    if(!ar || !kategoria || !leiras || !nev){
        res.json({message: "Hiányos adatok!"});
        return;
    }
    
    
}

const etelek  = async (req, res) => {

    const {ar, kategoria, leiras, nev} = req.body;

    if(!ar || !kategoria || !leiras || !nev){
        res.json({message: "Hiányos adatok!"});
        return;
    }

    const etel = await prisma.etelek.findFirst({
        where: {
            nev: nev
        }
    });


    if(etel){
        res.json({message: 'Ez az étel már foglalt'});
        return;
    }

    const ujEtel = await prisma.etelek.create({
        data: {
            ar: ar,
            kategoria: kategoria,
            leiras : leiras,
            nev: nev,
        }
    });
    res.json({message: 'Sikeres felvétel!'});
    
}


const getEtelek = async (req, res) => {
    const etelek = await prisma.etelek.findMany()
    res.json({message: etelek})
}

module.exports = {
    getEtelek,
    etelek,
    modositas
    
}
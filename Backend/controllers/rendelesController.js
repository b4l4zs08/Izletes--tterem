const { PrismaClient } = require("@prisma/client")
const prisma = new PrismaClient();

const rendelesek = async (req, res) => {
    const { ar, etelid, felhasznalo_id, mennyiseg } = req.body;

    if (!ar || !etelid || !felhasznalo_id || !mennyiseg ) {
        res.json({ message: "Hiányos adatok!" });
        return;
    }

    const ujRendeles = await prisma.rendeles.create({
        data: {
            ar: ar,
            etelid: Number(etelid),
            felhasznalo_id: Number(felhasznalo_id),
            mennyiseg: Number(mennyiseg),
            megjegyzes: ""
        }
    });
    res.json({ message: 'Sikeres rendelés!' });

}
const getRendelesek = async (req, res) => {
    const rendelesek = await prisma.rendeles.findMany(
        {
            select:{
                id: true,
                ar: true,
                etelid: true,
                etelek: true,
                felhasznalo_id: true,
                megjegyzes: true,
                statusz: true,
                mennyiseg:true
            }
        }
    )
    res.json(rendelesek);
}

const cangeStatusz = async (req,res) => {
    const { id } = req.body;
    try {
        const Statusz = await prisma.rendeles.update({
            where: {
                id: id
            },
            data: {
                statusz: "Elkészült"
            }
        })
        res.json({ statusz: Statusz })
    } catch (err) {
        res.json({ message: err.message});
    }
}


module.exports = {
    rendelesek,
    getRendelesek,
    cangeStatusz
}
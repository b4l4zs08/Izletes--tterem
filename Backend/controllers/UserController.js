const {PrismaClient} = require("@prisma/client")
const jwt = require('jsonwebtoken');
const argon2 = require('argon2');

const prisma = new PrismaClient();

const generateToken = (id) => {
    return jwt.sign({id}, process.env.JWT_SECRET, {expiresIn: '1d'});
}

const register = async (req, res) => {
    // kiszedjuk a dolgokat
    const {nev,email,telefonszam, cim, jelszo} = req.body;

    // csekkoljuk, hogy minden itt van-e ami kell
    if(!nev || !email || !telefonszam || !cim || !jelszo){
        res.json({message: "Hiányos adatok!"});
        return;
    }

    // megnézzuk létezik már user ilyen emailcimmel
    const user = await prisma.users.findUnique({
        where: {
            email: email
        }
    });

    if(user){
        res.json({message: 'Az email cím már foglalt'});
        return;
    }

    // titkositjuk a jelszot
    const hasheltJelszo = await argon2.hash(jelszo);

    // létrehozzuk az uj felhasznalot
    const ujUser = await prisma.users.create({
        data: {
            nev: nev,
            email: email,
            telefonszam: telefonszam,
            cim: cim,
            jelszo: hasheltJelszo
        }
    });

    const token = generateToken(ujUser.id);
    res.json({message: 'Sikeresen regisztrált',token: token});
}

const login = async(req, res) => {

    const {email, jelszo} = req.body;
    if(!email || !jelszo){
        res.json({message: 'Hiányzó adatok'});

    }

    // kikeressuk a felhasznalot aki be szeretne lépni
    const user = await prisma.users.findUnique({
        where: {
            email: email
        }
    });

    if(!user) {
        res.json({message: 'Felhasználó nem található'});
        return;
    }

    if(!(await argon2.verify(user.jelszo, jelszo))){
        res.json({message: 'Nem megfelelő a jelszó!'});
        return;
    }

    const token = generateToken(user.id);
    res.json({
        message: 'Sikeres bejelentkezés',
        token: token
    });

}

const getUsers = (req, res) => {
    res.json(req.user);
}

module.exports = {
    register,
    login,
    getUsers
}
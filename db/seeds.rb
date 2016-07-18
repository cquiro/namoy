# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

recipes = Recipe.create([
            { name:       "Muffins de chocolate con semillas de chía",
            time_ready:   "40 a 54 minutos",
            quantity:     "12 muffins", 
            flavor:       "natural",
            ingredients:  "6 cucharadas mantequilla blanda
1 taza de NA-MOY PANELA EN POLVO sabor natural
2 huevos\n3/4 taza de leche\n2 cucharaditas de vainilla\n1 1/2 tazas de harina de trigo
1/2 taza de cacao en polvo sin azúcar\n2 cucharaditas de Levadura en polvo
1/2 cucharadita de sal\n1/2 taza de semillas de chía\n1 cucharada de NA-MOY PANELA EN POLVO sabor natural",
            instructions: "Calienta el horno a 180°C.
Haz una línea de 12 copas para muffins con moldes de papel o rocía aceite en aerosol.
Bate la mantequilla y 1 taza de NA-MOY PANELA EN POLVO en un recipiente grande.
Agrega los huevos, la leche, la harina, el cacao , el polvo de hornear y la sal; bate en bajo hasta que esté mezclado . Agrega las semillas de chía y revuelve. Bate hasta que espese.
Divide en los moldes para muffins.
Espolvorea la cucharada de NA-MOY PANELA EN POLVO. Hornea de 30 a 35 minutos. Prueba insertando un cuchillo hasta que salga limpio.
Deja Enfriar en el molde 5 minutos ; trasladarlo a una bandeja metálica.",
            image:        File.open(File.join(Rails.root, 'app/assets/images/muffins_chocolate.jpg')) }, 
            { name:       "Café helado",
            time_ready:   "10 minutos",
            quantity:     "1 vaso", 
            flavor:       "natural",
            ingredients:  "1/2 taza de café expreso recién hecho
2 tazas y media de leche baja en grasas\n2 cucharadas de NA-MOY PANELA EN POLVO
6 cubos de hielo\nCrema chantilly para decoración",
            instructions: "Vierte todos los ingredientes en la licuadora hasta que quede como una crema congelada espesa.
Sirve y decora con crema Chantilly y espolvorea NA-MOY PANELA EN POLVO para decorar.",
            image:        File.open(File.join(Rails.root, 'app/assets/images/cafe_helado.jpg')) },
            { name:       "Lomo de cerdo caramelizado",
            time_ready:   "50 a 60 minutos",
            quantity:     "4 personas", 
            flavor:       "naranja",
            ingredients:  "500 gr de carne de cerdo\n7 cucharadas de NA-MOY PANELA EN POLVO sabor naranja
200 ml de zumo de naranja natural\n2 cucharadas de vinagre\n2 ramas de tomillo\n1 cucharada de aceite de girasol
1 pizca de sal y pimienta",
            instructions: "Añade el zumo de naranja  en una olla y agrega: vinagre y NA-MOY PANELA EN POLVO sabor naranja. Mezcla muy bien y cocina a fuego lento durante 10 minutos. Añade el tomillo y baja el fuego hasta obtener una consistencia de salsa un poco espesa. Retira las ramas de tomillo.
Precalienta el horno a 180 ° C  mientras espolvoreas pimienta y sal por todos los lados del lomo y sellar en un sartén con un poco de aceite de girasol. Cuándo esté dorado retirar del fuego.
Lleva el lomo de cerdo a una refractaria y unta con una brocha por todos lados la salsa a base NA-MOY PANELA EN POLVO en todos los lados y viértela un poco en la refractaria. Hornea durante 45 minutos. Retira al menos 3 veces el lomo mientras se hornea para untar de nuevo la salsa y ayudar a la caramelización.
Cuando esté listo deja reposar unos minutos, corta en rodajas y cubre con un poco más de salsa.",
            image:        File.open(File.join(Rails.root, 'app/assets/images/cerdo_caramelizado.jpg')) },
            { name:       "Vinagreta de limón",
            time_ready:   "5 minutos aprox.",
            quantity:     "1 copa", 
            flavor:       "limon",
            ingredients:  "1/2 taza de aceite de oliva\n1/4 de aceite de canola\n1/2 taza de jugo de limón
1/4 cucharadita de pimienta recién molida\n1 diente de ajo\n3/4 cucharadita de orégano seco
1 cucharadita de NA-MOY PANELA EN POLVO con sabor a limón",
            instructions: "Mezcla los ingredientes en un frasco, agita bien y lleva a la nevera. Llévala a temperatura ambiente antes de usarla.",
            image:        File.open(File.join(Rails.root, 'app/assets/images/vinagreta_limon.jpg')) }
            ])

user = User.create!(name: 'Namoy',
                   email: 'info@namoy.com',
                   password_digest: "#{User.digest('clave_temporal')}" )

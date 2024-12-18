import { DataTypes } from "sequelize";
import sequelize from "../config/db/sequelize.cofig.js";

const Mascotas = sequelize.define(
  "mascotas",
  {
    codigo: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true,
      validate: {
        is: /^[0-9]+$/i,
      },
    },
    nombre: {
      type: DataTypes.STRING,
      allowNull: false,
    },

    fechaNacimiento: {
      type: DataTypes.DATE,
      allowNull: false,
      field: "fecha_nacimiento",
    },
    // responsable: {
    //   type: DataTypes.STRING,
    //   allowNull: false,
    //   references: {
    //     model: "clientes",
    //     key: "dni",
    //   },
    // },
  },
  {
    tabeName: "mascotas",
    timestamps: true,
  }
);

export default Mascotas;
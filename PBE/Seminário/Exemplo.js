class Aluno {
  constructor(nome, idade) {
    this.nome = nome;       
    this.idade = idade;     
    this.matriculado = false;
  }

  apresentar() {
    return `Olá! Eu sou ${this.nome}.`; 
  }

  matricular() {
    this.matriculado = true; 
  }
}
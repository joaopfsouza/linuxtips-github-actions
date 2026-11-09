for (let i = 0; i < 12000; i++){
    console.log(`filler-${i}`);
    if (i === 6000){
        throw new Error(`À aplicação falhou pois faltou o Giropops`);        
    }
}
// Crates
use sbert::SBertRT;
use std::path::PathBuf;
use std::env::current_dir;

// Functions
pub fn sentence_similarity(prompt1: String, prompt2: String) {
    // Get the path to the weights
    let mut home: PathBuf = current_dir().unwrap();
    home.push("models");
    home.push("distiluse-base-multilingual-cased");

    // Initialize the model
    let sbert_model = SBertRT::new(home.to_str().unwrap()).unwrap();

    // Encode the sentences
    let texts = vec![prompt1, prompt2];
    let batch_size = 8;
    let output = sbert_model.encode(&texts.to_vec(), batch_size).unwrap();
}
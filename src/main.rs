// Crates
use sentence_similarity_rs::sentence_similarity;

fn main() {
    let p1 = "Hello World!";
    let p2 = "Hello Rust!";
    sentence_similarity(p1.to_string(), p2.to_string());
}

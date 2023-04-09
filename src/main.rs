// Crates
use sentence_similarity_rs::sentence_similarity;

#[tokio::main]
async fn main() {
    let prompt1 = "Hello Rust!";
    let prompt2 = "Hello World!";
    sentence_similarity(prompt1, prompt2).await;
}
